#! bash oh-my-bash.module

if [[ ${OSTYPE} != linux* ]] || \
    ! _omb_util_binary_exists "bluetoothctl" || \
    ! _omb_util_binary_exists "pactl"; then
    return
fi

function _omb_plugin_blueaudio_devices {
    for device in $(bluetoothctl devices Paired | awk '{ print $2 }'); do
        if ! bluetoothctl info "${device}" | grep -q 'UUID: Audio Sink'; then
            continue
        fi

        name=$(bluetoothctl info "${device}" | awk '/Alias:/ { print $2 }')
        alias $name="_omb_plugin_blueaudio_ctl ${device}"
        complete -F _complete_alias $name
    done
}

function _omb_plugin_blueaudio_ctl {
    [ $# -lt 2 ] && return 1

    case $2 in
        comm)
            card=$(echo $1 | sed -r 's/:/_/g')
            pactl set-card-profile "bluez_card.${card}" handsfree_head_unit 2>/dev/null
            ;;
        music)
            card=$(echo $1 | sed -r 's/:/_/g')
            pactl set-card-profile "bluez_card.${card}" a2dp_sink 2>/dev/null
            ;;
        on)
            bluetoothctl connect "$1" >/dev/null 2>&1
            ;;
        off)
            bluetoothctl disconnect "$1" >/dev/null 2>&1
            ;;
        status)
            status=$(bluetoothctl info "$1" | awk '/Connected:/ { print $2 }')
            case $status in
                yes)
                    echo "connected"
                    ;;
                no)
                    echo "disconnected"
                    ;;
                *)
                    echo "not available"
                    return 1
                    ;;
            esac
            ;;
        battery)
            percentage=$(bluetoothctl info "$1" | awk '/Battery Percentage/ { print $4 }' | tr -d '()')
            if [[ -z "$percentage" ]]; then
                return 1
            fi
            echo "${percentage}%"
            ;;
        *)
            return 1
            ;;
    esac
}

function _omp_plugin_blueaudio_completion {
    local cur prev words cword
    _get_comp_words_by_ref -n : cur prev words cword

    mapfile -t COMPREPLY < <(compgen -W "comm music on off status battery" -- "$cur")
}
complete -F _omp_plugin_blueaudio_completion _omb_plugin_blueaudio_ctl

_omb_plugin_blueaudio_devices
unset -f _omb_plugin_blueaudio_devices
