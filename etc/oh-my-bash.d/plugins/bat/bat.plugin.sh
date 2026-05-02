#! bash oh-my-bash.module

function _omb_plugin_bat_alias {
    local executable=$1
    local plain=$2
    local language=$3

    if [[ ${plain} == "true" ]]; then
        ${executable} --plain --language="${language}" "${@:4}"
    else
        ${executable} --language="${language}" "${@:4}"
    fi
}

function _omb_plugin_bat_help() {
    local executable=$1
    shift

    "$@" --help 2>&1 | ${executable} --plain --language=help
}

function _omb_plugin_bat {
    local executable
    local available="false"

    for executable in bat batcat; do
        if _omb_util_binary_exists "${executable}"; then
            available="true"
            break
        fi
    done

    if [[ ${available} == "false" ]]; then
        unset -f _omb_plugin_bat_alias
        unset -f _omb_plugin_bat_help
        return
    fi

    export BAT_THEME=${BAT_THEME:-"Solarized (dark)"}

    alias b="${executable}"
    alias bl="_omb_plugin_bat_alias ${executable} false"
    alias bp="${executable} --plain"
    alias blp="_omb_plugin_bat_alias ${executable} true"
    alias cat="${executable} --paging=never --plain"
    alias help="_omb_plugin_bat_help ${executable}"
}

_omb_plugin_bat
unset -f _omb_plugin_bat


