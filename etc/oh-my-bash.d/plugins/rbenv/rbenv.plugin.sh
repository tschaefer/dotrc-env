#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.rbenv ]]; then
    export PATH=${OSH_HOME:-$HOME}/.rbenv/bin:${PATH}
    if _omb_util_function_exists _omb_is_root && _omb_user_is_root; then
        ROOT=$HOME
        export HOME=${OSH_HOME:-$HOME}
        eval "$(rbenv init - bash)"
        export HOME=$ROOT

        unset ROOT
    else
        eval "$(rbenv init - bash)"
    fi
fi
