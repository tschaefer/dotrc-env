#! bash oh-my-bash.module

OMB_PLUGIN_EDITOR_LIST=${OMB_PLUGIN_EDITOR_LIST:-"nano vim vi"}

function _omb_plugin_editor {
    local editor

    for editor in ${OMB_PLUGIN_EDITOR_LIST}; do
        if _omb_util_command_exists ${editor}; then
            export EDITOR=${editor}
            export VISUAL=$EDITOR

            break
        fi
    done
}

_omb_plugin_editor