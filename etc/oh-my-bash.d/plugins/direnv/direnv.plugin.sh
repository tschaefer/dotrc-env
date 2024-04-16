#! bash oh-my-bash.module

if _omb_util_binary_exists "direnv"; then
    eval "$(direnv hook bash)"
fi
