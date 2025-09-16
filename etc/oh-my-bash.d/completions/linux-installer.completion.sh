_linux_installer() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local long_options='--help --man --config-file --log-config-file'
    local short_options='-h -m -f -l'
    local options="$long_options $short_options"

    case $prev in
        --help|-h|--man|-m)
            return 1
            ;;
        --config-file|-f|--log-config-file|-l)
            _filedir
            return 1
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W '$options' -- "$cur")
        return
    fi

    _filedir
    return
}

complete -F _linux_installer linux-installer

# vim: ft=sh
