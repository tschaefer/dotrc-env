_meme_action() {
    local cur
    _get_comp_words_by_ref -n : cur

    local options='--animated --example --shorten'

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi
}

_meme() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions
    actions=$(meme --list | awk -F ':' '{ print $1 }')
    local options='--help --man --version --list'

    for word in "${words[@]}"; do
        if grep -qw $word <<< $actions 2>/dev/null; then
            _meme_action
            return
        fi
    done

    case "$prev" in
        --help|--man|--version|--list)
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

complete -F _meme meme

# vim: ft=sh
