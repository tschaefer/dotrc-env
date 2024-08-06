if [[ -e /usr/share/bash-completion/completions/ssh ]]; then
    source /usr/share/bash-completion/completions/ssh

    complete -F _ssh sshrc
fi

# vim: ft=sh
