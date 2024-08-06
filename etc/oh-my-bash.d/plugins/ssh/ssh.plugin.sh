#! bash oh-my-bash.module

if [[ -S ${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh ]]; then
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh
elif [[ -S ${XDG_RUNTIME_DIR}/ssh-agent.socket ]]; then
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket
fi

function _omb_plugin_ssh_config {
    local ssh_home

    ssh_home=${OSH_HOME:-$HOME}/.ssh
    rm -f "${ssh_home}"/config
    cat "${ssh_home}"/config.global "$(ls "${ssh_home}"/config.local \
        2>/dev/null || echo /dev/null)" | \
        grep --invert-match "^#" > "${ssh_home}"/config

    echo "# vim:ft=sshconfig" >> "${ssh_home}"/config
}

function _omb_plugin_ssh_kill {
    pgrep -a -f '\[mux\]' | grep -w "$1" | awk '{ print $1 }' | \
        xargs kill -9 2>/dev/null

    find "${OSH_HOME:-$HOME}"/.ssh/cache -type s -name "*$1*" -delete
}

function _omb_plugin_ssh_list {
    pgrep -a -f '\[mux\]' | \
        awk -F '/' '{ print $NF }' | sed 's/ \[mux\]//'
}

function _omb_plugin_ssh_screen {
    ssh "$@" -t screen -Rd
}

function _omb_plugin_mosh_screen {
    mosh "$@" -- screen -Rd
}

function _omb_plugin_ssh_tmux {
    ssh "$@" -t tmux -2u new -As0
}

function _omb_plugin_mosh_tmux {
    mosh "$@" -- tmux -2u new -As0
}

function _omb_plugin_ssh_run {
    [ $# -lt 2 ] && return 1

    local host=$1
    local exec=$2
    local args=${*:3}

    if ! _omb_util_binary_exists ${exec}; then
        return 1
    fi

    exec=$(type -P -- ${exec})
    if [[ $(file --mime-type ${exec} | awk '{ print $2 }') != 'text/x-shellscript' ]]; then
        return 1
    fi

    ssh -t "${host}" "
        export RUN_LIB="'$(mktemp -d -p /tmp ssh-run.XXXXXX)'"
        "'trap "rm -rf ${RUN_LIB}" EXIT'"
        echo $'"$(cat ${exec} | xxd -ps)"' | xxd -ps -r > "'${RUN_LIB}/run'"
        "'chmod +x ${RUN_LIB}/run'"
        bash "'${RUN_LIB}/run'" ${args}
    "

    return $?
}

alias ssh-kill='_omb_plugin_ssh_kill'
alias ssh-list='_omb_plugin_ssh_list'
alias ssh-run='_omb_plugin_ssh_run'
alias ssh-config='_omb_plugin_ssh_config'
alias ssh-screen='_omb_plugin_ssh_screen'
alias mosh-screen='_omb_plugin_mosh_screen'
alias ssh-tmux='_omb_plugin_ssh_tmux'
alias mosh-tmux='_omb_plugin_mosh_tmux'

if [[ -f ${OSH}/completions/ssh.completion.sh ]]; then
    source ${OSH}/completions/ssh.completion.sh
    complete -o default -o nospace -F _omb_completion_ssh ssh-run ssh-screen ssh-tmux mosh mosh-screen mosh-tmux
fi
