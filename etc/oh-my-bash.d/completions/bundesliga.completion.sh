_bundesliga_action() {
    local cur prev words
    _get_comp_words_by_ref cur prev words

    local options='--help --man --version --league'

    case "$prev" in
        --league)
            local leagues
            leagues=$(bundesliga --available-leagues | tr -d ',')
            mapfile -t COMPREPLY < <(compgen -W "${leagues}" -- "$cur")
            return
            ;;
        --help|--man|--version)
            return
            ;;
    esac

    mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
}


_bundesliga() {
    local cur prev words
    _get_comp_words_by_ref cur prev words

    local actions='matchday standings'
    local options='--help --man --version --available-leagues'

    case $prev in
        --help|--man|--version|--available-leagues)
            return
            ;;
    esac

    local word
    for word in "${words[@]}"; do
        case $word in
            matchday|standings)
                _bundesliga_action
                return
                ;;
        esac
    done

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")

    return
}

complete -F _bundesliga bundesliga

# vim: ft=sh
