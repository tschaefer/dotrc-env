_tls-ping() {
    local cur prev
    _get_comp_words_by_ref cur prev

    local options='--help --man --version --due --starttls --quiet'

    if [[ -n $prev ]] && [[ $prev != tls-ping ]]; then
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "$options" -- "$cur")
}

complete -F _tls-ping tls-ping

# vim: ft=sh
