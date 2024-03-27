#! bash oh-my-bash.module

if [[ -S ${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh ]]; then
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh
elif [[ -S ${XDG_RUNTIME_DIR}/ssh-agent.socket ]]; then
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket
fi

GPG_TTY=$(tty)
export GPG_TTY

if _omb_util_command_exists direnv; then
    eval "$(direnv hook bash)"
fi

OMB_PLUGIN_MISC_ROOT_USAGE="true"
function _omb_user_is_root {
    test ${EUID} -eq 0
}
