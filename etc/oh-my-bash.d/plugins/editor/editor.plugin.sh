#! bash oh-my-bash.module

OMB_PLUGIN_EDITOR_LIST=${OMB_PLUGIN_EDITOR_LIST:-"nano vim nvim vi emacs"}

function _omb_plugin_editor {
    local editor

    for editor in ${OMB_PLUGIN_EDITOR_LIST}; do
        if _omb_util_binary_exists "${editor}"; then
            export EDITOR=${editor}
            export VISUAL=$EDITOR

            alias e="$EDITOR"

            break
        fi
    done
}

_omb_plugin_editor
unset -f _omb_plugin_editor
