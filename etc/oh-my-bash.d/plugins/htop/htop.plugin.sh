#! bash oh-my-bash.module

if _omb_util_binary_exists "htop" && \
    [[ -e "${OSH_HOME:-$HOME}/.htoprc" ]]; then

    export HTOPRC="${OSH_HOME:-$HOME}/.htoprc"
    if [[ ! -w "${HTOPRC}" ]]; then
        alias htop='htop 2>/dev/null'
    fi
fi
