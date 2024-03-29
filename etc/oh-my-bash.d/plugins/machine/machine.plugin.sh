#! bash oh-my-bash.module

function _omb_plugin_machine {
    if [[ ! -e /etc/machine-id ]]; then
        return
    fi

    local machine_id
    machine_id=$(cat /etc/machine-id)
    if [[ -e ${OSH_CUSTOM}/plugins/machine/machine.d/${machine_id} ]]; then
        source ${OSH_CUSTOM}/plugins/machine/machine.d/${machine_id}
    fi
}
_omb_plugin_machine
unset -f _omb_plugin_machine
