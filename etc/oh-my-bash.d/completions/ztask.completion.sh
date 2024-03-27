_info() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${info}" -- "$cur")
        return
    fi
}

_display() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--pager --no-pager --legend --no-legend'
    local info='--help --man --version'
    local extra='--date'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        if [[ "$prev" =~ by-* ]]; then
            mapfile -t COMPREPLY < <(compgen -W "${options} ${extra} ${info}" -- "$cur")
            return
        fi
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}

_task_update() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--project --activity --day --started_at --ended_at --note'
    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}


_task_add() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--project --activity --day --started_at --ended_at'
    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}

_tracker_start() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--project --activity'
    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}

_tracker() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions='start status stop'
    local info='--help --man --version'

    for word in "${words[@]}"; do
        case $word in
            start)
                _tracker_start
                return
                ;;
            status|stop)
                _info
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
        mapfile -t COMPREPLY < <(compgen -W "${info}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")

    return
}


_ztask() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions='tracker add day delete monthly show today update weekly by-project by-activity'
    local options='--projects --activities --configuration-file'
    local info='--help --man --version'

    for word in "${words[@]}"; do
        case $word in
            add)
                _task_add
                return
                ;;
            update)
                _task_update
                return
                ;;
            monthly|today|weekly|day|by-project|by-activity)
                _display
                return
                ;;
            delete|show)
                _help
                return
                ;;
            tracker)
                _tracker
                return
                ;;
        esac
    done

    case "$prev" in
        --help|--man|--version|--projects|--activities)
            return
            ;;
        --configuration-file)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")

    return
}

complete -F _ztask ztask

# vim: ft=sh
