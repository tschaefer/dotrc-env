#! bash oh-my-bash.module

GPG_TTY=$(tty)
export GPG_TTY

function _omb_plugin_gpg_ykunlock {
    local serial

    serial=$(gpg-connect-agent 'scd serialno' /bye | head -n 1 | cut -f3 -d' ')
    gpg-connect-agent "scd checkpin $serial" /bye
}
alias ykunlock='_omb_plugin_gpg_ykunlock'
