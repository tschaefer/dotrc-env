_tube_shows() {
    local cur prev words
    _get_comp_words_by_ref cur prev words cword

    local actions='shows'
    local options='--help --man --version --category --scheduled'
    local categories='alternative kids main news regional sports'
    local schedules='now prime'

    case "$prev" in
        --category)
            mapfile -t COMPREPLY < <(compgen -W "${categories}" -- "$cur")
            return
            ;;
        --scheduled)
            mapfile -t COMPREPLY < <(compgen -W "${schedules}" -- "$cur")
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi

    return
}

_tube() {
    local cur prev words
    _get_comp_words_by_ref cur prev words cword

    local actions='shows'
    local options='--help --man --version'

    local word action
    for word in "${words[@]}"; do
        case $word in
            shows)
                action=$word
                break
                ;;
        esac
    done

    case $action in
        shows)
            _tube_shows
            return
            ;;
    esac

    local commands
    if [[ "$cur" == -* ]]; then
        commands="$options"
    else
        commands="$actions"
    fi

    mapfile -t COMPREPLY < <(compgen -W "${commands}" -- "$cur")

    return
}

complete -F _tube tube

# vim: ft=sh
