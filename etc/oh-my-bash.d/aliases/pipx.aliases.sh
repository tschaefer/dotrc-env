#! bash oh-my-bash.module

if _omb_util_binary_exists pipx; then
    if _omb_util_binary_exists register-python-argcomplete; then
        eval "$(register-python-argcomplete pipx)"
    elif _omb_util_binary_exists register-python-argcomplete2; then
        eval "$(python-argcomplete2 pipx)"
    elif _omb_util_binary_exists register-python-argcomplete3; then
        eval "$(python-argcomplete3 pipx)"
    fi
fi
