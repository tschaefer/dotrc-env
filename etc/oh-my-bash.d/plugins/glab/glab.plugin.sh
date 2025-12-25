#! bash oh-my-bash.module

if _omb_util_binary_exists glab; then
    source <(glab completion)
fi
