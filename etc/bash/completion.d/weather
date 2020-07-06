_weather() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    if [[ "$prev" == -* ]]; then
        return
    fi

    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W '--help --man --forecast' -- "$cur"))
        return
    fi

    return
}

complete -F _weather weather

# vim: ft=sh
