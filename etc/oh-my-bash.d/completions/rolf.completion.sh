_query() {
local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--full --json'
    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
        --full|--json)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}

_rolf() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions='query'
    local options='--help --man --version'

    for word in "${words[@]}"; do
        case $word in
            query)
                _query
                return
                ;;
        esac
    done

    case "$prev" in
        --help|--man|--version)
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

complete -F _rolf rolf

# vim: ft=sh
