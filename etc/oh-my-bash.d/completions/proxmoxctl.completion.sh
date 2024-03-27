_proxmoxctl_config() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='show set'

    # actions
    case $prev in
        set|show)
            return
            ;;
    esac

    # complete actions
    COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
    return
}

_proxmoxctl_device() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='add delete'

    # actions
    case $prev in
        add|delete)
            return
            ;;
    esac

    # complete options
    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W '--driver --id' -- "$cur"))
        return
    fi

    # complete actions
    COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
    return
}

_proxmoxctl_vnc() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='status enable'

    # actions
    case $prev in
        status|enable)
            return
            ;;
    esac

    # complete options
    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W '--ip --port' -- "$cur"))
        return
    fi

    # complete actions
    COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
    return
}

_proxmoxctl() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local base_actions='reset resume start status stop suspend shutdown node'
    local sub_actions='config vnc device'
    local info_actions='help man'
    local actions="$base_actions $sub_actions $info_actions"

    # action
    local word action
    for word in "${words[@]}"; do
        case $word in
            reset|resume|start|status|stop|supend|shutdown|node|config|vnc|device|help|man)
                action=$word
                break
                ;;
        esac
    done

    # base actions
    case $action in
        reset|resume|start|status|stop|supend|shutdown|node|help|man)
            return
            ;;
    # sub actions
        config)
            _proxmoxctl_config
            return
            ;;
        vnc)
            _proxmoxctl_vnc
            return
            ;;
        device)
            _proxmoxctl_device
            return
            ;;
    esac

    # basic options
    case "$prev" in
        --config)
            _filedir
            return
            ;;
    esac

    # complete basic options
    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W '--config --vm' -- "$cur"))
        return
    fi

    # complete actions
    COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
    return
}

complete -F _proxmoxctl proxmoxctl

# vim: ft=sh
