#! bash oh-my-bash.module

function _omb_plugin_ssh_config {
    local ssh_home

    ssh_home=${OSH_HOME:-$HOME}/.ssh
    cat ${ssh_home}/config.global "$(ls ${ssh_home}/config.local \
        2>/dev/null || echo /dev/null)" | grep -v "^#" > ${ssh_home}/config

    echo "# vim:ft=sshconfig" >> ${ssh_home}/config
}

function _omb_plugin_ssh_kill {
    ps -e -o pid,command | grep '\[mux\]' | \
        grep -w "$1" | awk '{ print $1 }' | \
        xargs kill -9 2>/dev/null
}

function _omb_plugin_ssh_list {
    ps -e -o pid,command | grep '\[mux\]' | \
        awk -F '/' '{ print $NF }' | sed 's/ \[mux\]//'
}

function _omb_plugin_ssh_screen {
    ssh "$@" -t screen -Rd
}

function _omb_plugin_mosh_screen {
    mosh "$@" -- screen -Rd
}

alias ssh-kill='_omb_plugin_ssh_kill'
alias ssh-list='_omb_plugin_ssh_list'
alias ssh-config='_omb_plugin_ssh_config'
alias ssh-screen='_omb_plugin_ssh_screen'
alias mosh-screen='_omb_plugin_mosh_screen'
