_perlgib_doc() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local options='--output-path --output-format --document-private-items \
    --document-ignored-items --ignore-undocumented-items --no-html-index'
    local formats='html markdown pod all'

    case "$prev" in
        --output-path)
            _filedir
            return
            ;;
        --output-format)
            mapfile -t COMPREPLY < <(compgen -W "${formats}" -- "$cur")
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi
}

_perlgib() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='doc test'
    local options='--help --man --version --library-name --library-path'

    local word action
    for word in "${words[@]}"; do
        case $word in
            doc|test)
                action=$word
                break
                ;;
        esac
    done

    case $action in
        test)
            return
            ;;
        doc)
            _perlgib_doc
            return
            ;;
    esac

    case "$prev" in
        --library-path)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
    return
}

complete -F _perlgib perlgib

# vim: ft=sh
