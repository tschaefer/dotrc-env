#! bash oh-my-bash.module

OMB_PLUGIN_FZF_KEY_BINDINGS=${OMB_PLUGIN_FZF_KEY_BINDINGS:-/usr/share/doc/fzf/examples/key-bindings.bash}
OMB_PLUGIN_FZF_COMPLETION=${OMB_PLUGIN_FZF_COMPLETION:-/usr/share/bash-completion/completions/fzf}

function _omb_plugin_fzf {
    if ! _omb_util_binary_exists "fzf"; then
        return
    fi

    local cur
    local req

    cur="$(fzf --version | awk '{ print $1 }')"
    req='0.48.0'

    if [ "$(printf '%s\n' "${req}" "${cur}" | sort --version-sort | head --lines=1)" = "${req}" ]; then
        eval "$(fzf --bash)"
    else
        source "${OMB_PLUGIN_FZF_KEY_BINDINGS}"
        source "${OMB_PLUGIN_FZF_COMPLETION}"
    fi

    if _omb_util_binary_exists "fd"; then
        export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude .git'
    fi
}

_omb_plugin_fzf
unset -f _omb_plugin_fzf
