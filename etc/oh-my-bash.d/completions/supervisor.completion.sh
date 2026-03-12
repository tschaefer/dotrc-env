__supervisor_stacks_completion() {
    type -P -- jq &>/dev/null || return

    local cur prev words
    _get_comp_words_by_ref -n : cur words

    for word in "${words[@]}"; do
        if [[ ${word} =~ ^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$ ]]; then
            return
        fi
    done

    local configuration_file
    for ((i=0; i < ${#words[@]}; i++)); do
        if [[ "${words[i]}" == "--configuration-file" ]]; then
            configuration_file="${words[i]} ${words[i+1]}"
            break
        fi
    done

    local cmd
    cmd="supervisor ${configuration_file} stacks list --json"

    local stacks
    stacks=$(eval ${cmd} | jq -r '.[].uuid')

    mapfile -t COMPREPLY < <(compgen -W "${stacks}" -- "$cur")
}

_supervisor_stack_update() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help'
    local options_update='--manifest-file --decrypt'

    options="${options} ${options_update}"

    case "$prev" in
        --help)
            return
            ;;
        --manifest-file)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_stack_create() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help'
    local options_create='--manifest-file --decrypt'

    options="${options} ${options_create}"

    case "$prev" in
        --help)
            return
            ;;
        --manifest-file)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}

_supervisor_stack_show() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --json'
    local options_show='--unfiltered'

    options="${options} ${options_show}"

    case "$prev" in
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_stacks_list() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --json'

    case "$prev" in
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}

_supervisor_stack_stats() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --json'

    case "$prev" in
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_stack_delete() {
    local cur
    _get_comp_words_by_ref -n : cur

    local options='--help'

    case "$prev" in
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_stack_control() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --command'
    local actions='start stop restart redeploy pause unpause'

    case "$prev" in
        --command)
            mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
            return
            ;;
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_stack_log() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --json --entries --follow'

    case "$prev" in
        --help)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi

    __supervisor_stacks_completion
}

_supervisor_health() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local options='--help --json --quiet'

    case "$prev" in
        --help|--json|--quiet)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}

_supervisor_deploy() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--help'
    local options_deploy='--host --skip-docker --skip-traefik --verbose'

    options="${options} ${options_deploy}"

    case "$prev" in
        --help)
            return
            ;;
        --host)
            _known_hosts
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}

_supervisor_redeploy() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--help'
    local options_deploy='--host --verbose --with-traefik'

    options="${options} ${options_deploy}"

    case "$prev" in
        --help)
            return
            ;;
        --host)
            _known_hosts
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}

_supervisor_dashboard() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--help'
    local options_dashboard='--open'

    options="${options} ${options_dashboard}"

    case "$prev" in
        --help)
            return
            ;;
        --open)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
        return
    fi
}


_supervisor_stacks() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions="create delete list show stats update control log"
    local options='--help --man --version'

    local word
    for word in "${words[@]}"; do
        case $word in
            delete)
                _supervisor_stack_delete
                return
                ;;
            create)
                _supervisor_stack_create
                return
                ;;
            update)
                _supervisor_stack_update
                return
                ;;
            list)
                _supervisor_stacks_list
                return
                ;;
            stats)
                _supervisor_stack_stats
                return
                ;;
            show)
                _supervisor_stack_show
                return
                ;;
            control)
                _supervisor_stack_control
                return
                ;;
            log)
                _supervisor_stack_log
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
}

_supervisor() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local actions="dashboard redeploy deploy is-healthy stacks"
    local options='--help --man --version'
    local options_config='--configuration-file'

    options="${options} ${options_config}"

    local word
    for word in "${words[@]}"; do
        case $word in
            dashboard)
                _supervisor_dashboard
                return
                ;;
            deploy)
                _supervisor_deploy
                return
                ;;
            redeploy)
                _supervisor_redeploy
                return
                ;;
            is-healthy)
                _supervisor_health
                return
                ;;
            stacks)
                _supervisor_stacks
                return
                ;;
        esac
    done

    case "$prev" in
        --help|--man|--version)
            return
            ;;
        --configuration-file)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
}

complete -F _supervisor supervisor

# vim: ft=sh
