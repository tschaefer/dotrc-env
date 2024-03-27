#! bash oh-my-bash.module

OMB_PLUGIN_USER_TMP_REMOVE_ON_EXIT="false"

if [[ -n ${XDG_RUNTIME_DIR} ]]; then
    OSH_TMP=${XDG_RUNTIME_DIR}/tmp
else
    OSH_TMP=/tmp/${USER}.tmp
fi

if [[ ${OMB_PLUGIN_USER_TMP_REMOVE_ON_EXIT} == "true" ]]; then
    trap 'rm -rf ${OSH_TMP}' EXIT
fi

if [[ ! -d "${OSH_TMP}" ]]; then
    mkdir --mode=0700 "${OSH_TMP}" >/dev/null
fi
export OSH_TMP
