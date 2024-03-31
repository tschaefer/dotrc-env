#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.rbenv ]]; then
    if _omb_plugin_misc_user_is_root; then
        export PATH=${OSH_HOME:-$HOME}/.rbenv/shims:${PATH}
    else
        export PATH=${OSH_HOME:-$HOME}/.rbenv/bin:${PATH}
        eval "$(rbenv init - bash)"
    fi
fi
