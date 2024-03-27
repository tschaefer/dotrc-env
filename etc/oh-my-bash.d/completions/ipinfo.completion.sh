_ipinfo() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    if [[ "$prev" == -* ]]; then
        return
    fi

    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W '--help --man' -- "$cur"))
        return
    fi

    _ip_addresses
    return
}



complete -F _ipinfo ipinfo

# vim: ft=sh
