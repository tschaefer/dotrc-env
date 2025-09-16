if [[ -e /usr/share/bash-completion/completions/ssh ]]; then
    source /usr/share/bash-completion/completions/ssh

    complete -F _comp_cmd_ssh sshrc
fi

# vim: ft=sh
