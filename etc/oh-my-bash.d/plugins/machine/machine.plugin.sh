#! bash oh-my-bash.module

function _omb_plugin_machine {
    local machine_id
    machine_id=$(cat /etc/machine-id 2>/dev/null || cat /etc/hostname 2>/dev/null || hostname)
    if [[ -f ${OSH_CUSTOM}/plugins/machine/machine.d/${machine_id} ]]; then
        source "${OSH_CUSTOM}/plugins/machine/machine.d/${machine_id}"
    fi
}
_omb_plugin_machine
unset -f _omb_plugin_machine
