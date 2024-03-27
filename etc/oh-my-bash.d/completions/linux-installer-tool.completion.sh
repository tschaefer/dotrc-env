_linux_installer_base() {
    local prev=$1 cur=$2

    local long_options='--help --man --config-file --log-config-file'
    local short_options='-h -m -f -l'
    local options="$long_options $short_options"

    case "$prev" in
        --help|-h|--man|-m)
            return 1
            ;;
        --config-file|-f|--log-config-file|-l|--root-path|-r)
            _filedir
            return 1
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        COMPREPLY+=($(compgen -W '$options' -- "$cur"))
        return 1
    fi

    return 0
}

_linux_installer_tool() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='mount umount chroot spawn'

    _linux_installer_base "$prev" "$cur"
    local rc=$?
    if [[ $rc -eq 1 ]]; then
        return
    fi

    local word action
    for word in "${words[@]}"; do
        case "$word" in
            mount|umount|chroot|spawn)
                action="$word"
                break
                ;;
        esac
    done

    if [[ -z $action ]]; then
        COMPREPLY=($(compgen -W '$actions' -- "$cur"))
    else
        _filedir
    fi

    return
}

_linux_installer_action() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    _linux_installer_base "$prev" "$cur"
    local rc=$?
    if [[ $rc -eq 1 ]]; then
        return
    fi

    _filedir
    return
}

complete -F _linux_installer_tool linux-installer-tool
complete -F _linux_installer_action linux-installer-mount
complete -F _linux_installer_action linux-installer-umount
complete -F _linux_installer_action linux-installer-chroot
complete -F _linux_installer_action linux-installer-spawn

# vim: ft=sh
