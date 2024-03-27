_vagrantctl() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='config halt list resume reload ssh-config status up'

    if [[ $cword == 1 ]]; then
        if [[ "$cur" == -* ]]; then
            COMPREPLY=($(compgen -W '--base-directory --help --verbose' \
                -- "$cur"))
        else
            COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
        fi
        return 0
    fi

    case "$prev" in
        --help)
            return 0;
            ;;
        --base-directory)
            _filedir
            return 0;
            ;;
        --verbose)
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W '--base-directory' -- "$cur"))
            else
                COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
            fi
            return 0;
            ;;
        --show)
            COMPREPLY=($(compgen -W '$(vagrantctl list)' -- "$cur"))
            return 0;
            ;;
        list)
            return 0;
            ;;
        config)
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W '--show' -- "$cur"))
            else
                COMPREPLY=($(compgen -W '$(vagrantctl list)' -- "$cur"))
            fi
            return 0
            ;;
        halt|resume|reload|ssh-config|status|up)
            COMPREPLY=($(compgen -W '$(vagrantctl list)' -- "$cur"))
            return 0;
            ;;
        *)
            if [[ "${words[cword-2]}" == --base-directory ]]; then
                if [[ "$cur" == -* ]]; then
                    COMPREPLY=($(compgen -W '--verbose' -- "$cur"))
                else
                    COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
                fi
            fi
            return 0;
            ;;
    esac

    return 0
}
complete -F _vagrantctl vagrantctl

# vim:ft=sh:
