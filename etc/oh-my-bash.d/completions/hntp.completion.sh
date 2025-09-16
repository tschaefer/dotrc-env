_hntp() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    if [[ "$prev" == -* ]]; then
        return
    fi

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W '--help --man --formatted' -- "$cur")
        return
    fi

    return
}

complete -F _hntp hntp

# vim: ft=sh
