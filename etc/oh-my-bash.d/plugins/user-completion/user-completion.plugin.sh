#! bash oh-my-bash.module

function _omb_plugin_user_completion {
    local completion

    for completion in ${OSH_CUSTOM}/completions/*; do
        . $completion
    done
}
_omb_plugin_user_completion
