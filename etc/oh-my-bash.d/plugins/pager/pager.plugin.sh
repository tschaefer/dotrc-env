#! bash oh-my-bash.module

if _omb_util_command_exists less; then
    export PAGER=less
    export LESS="-F -R -M --shift 5 -x 4"
    export LESSCOLOR="always"
    export LESSQUIET=1
    export LESSHISTFILE=-

    if [[ -x $(type -P lesspipe) ]]; then
        eval "$(lesspipe)"
    fi
else
    export PAGER=more
fi

if _omb_util_command_exists manpager; then
    export MANPAGER=manpager
fi
