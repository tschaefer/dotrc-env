#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.rbenv ]]; then
    export PATH=${OSH_HOME:-$HOME}/.rbenv/bin:${PATH}
    if _omb_util_function_exists _omb_plugin_misc_user_is_root && \
        _omb_plugin_misc_user_is_root; then
        root=$HOME
        export HOME=${OSH_HOME:-$HOME}
        eval "$(rbenv init - bash)"
        export HOME=$root

        unset -v root
    else
        eval "$(rbenv init - bash)"
    fi
fi
