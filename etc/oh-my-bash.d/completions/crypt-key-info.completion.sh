_crypt_key_info() {
    local cur
    _get_comp_words_by_ref cur

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W '--help --man --passphrase --json' -- "$cur")
        return 0
    else
        _filedir
    fi
}

complete -F _crypt_key_info crypt-key-info

# vim: ft=sh
