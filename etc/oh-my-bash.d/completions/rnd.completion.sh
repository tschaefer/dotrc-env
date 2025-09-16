_rnd() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    local actions='zap-entropy-count clear-pool get-entropy-count add-to-entropy-count add-entropy get-random help man'

    if [[ $cword == 1 ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
        return 0
    fi

    local action=${words[1]}

    case "$action" in
        help|man)
            return 0;
            ;;
        zap-entropy-count|clear-pool)
            return 0;
            ;;
        get-entropy-count)
            return 0;
            ;;
        add-to-entropy-count)
            return 0;
            ;;
        add-entropy)
            _filedir
            return 0;
            ;;
        get-random)
            if [[ "$prev" == --device ]]; then
                mapfile -t COMPREPLY < <(compgen -W 'random urandom' -- "$cur")
                return 0;
            fi
            if [[ "$prev" == --format ]]; then
                mapfile -t COMPREPLY < <(compgen -W 'binary base64' -- "$cur")
                return 0;
            fi
            if [[ "$cur" == -* ]]; then
                mapfile -t COMPREPLY < <(compgen -W '--device --bytes --format' -- "$cur")
            fi
            return 0;
            ;;
        *)
            return 0;
            ;;
    esac

    return 0

}

complete -F _rnd rnd

# vim:ft=sh:
