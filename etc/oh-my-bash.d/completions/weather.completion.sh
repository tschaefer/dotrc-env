_weather() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    if [[ "$prev" == "--forecast" ]]; then
        mapfile -t COMPREPLY < <(compgen -W '1 2 3 4 5' -- "$cur")
        return
    fi

    if [[ "$prev" == -* ]]; then
        return
    fi

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W '--help --man --forecast' -- "$cur")
        return
    fi

    return
}

complete -F _weather weather

# vim: ft=sh
