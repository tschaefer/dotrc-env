#! bash oh-my-bash.module

if _omb_util_binary_exists "less"; then
    export PAGER="less"
    export LESS="-F -R -M --shift 5 -x 4"
    export LESSQUIET="true"
    export LESSHISTFILE="-"

    if _omb_util_binary_exists "lesspipe"; then
        eval "$(lesspipe)"
    fi
else
    export PAGER=more
fi

if _omb_util_binary_exists "manpager"; then
    export MANPAGER=manpager
fi
