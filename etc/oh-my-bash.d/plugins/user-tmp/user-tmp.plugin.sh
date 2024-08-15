#! bash oh-my-bash.module

OMB_PLUGIN_USER_TMP_REMOVE_ON_EXIT=${OMB_PLUGIN_USER_TMP_REMOVE_ON_EXIT:-"false"}

if [[ ${OMB_PLUGIN_USER_TMP_REMOVE_ON_EXIT} == "true" ]]; then
    OSH_TMP=$(mktemp --directory --tmpdir="${XDG_RUNTIME_DIR:-/tmp}")
    trap 'rm -rf ${OSH_TMP}' EXIT
else
    if [[ -n ${XDG_RUNTIME_DIR} ]]; then
        OSH_TMP=${XDG_RUNTIME_DIR}/tmp
    else
        OSH_TMP=/tmp/${USER}.tmp
    fi
    # shellcheck disable=SC2174
    mkdir -p -m 0700 "${OSH_TMP}" >/dev/null
fi
export OSH_TMP
