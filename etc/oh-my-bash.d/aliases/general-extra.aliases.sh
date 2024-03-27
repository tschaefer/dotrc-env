#! bash oh-my-bash.module

OMB_PLUGIN_EDITOR_ALIAS="true"

if [[ ${OMB_PLUGIN_EDITOR_ALIAS} == "true" ]]; then
    case $EDITOR in
        nano)
            if [[ -e ${OSH_HOME:-$HOME}/.nanorc ]]; then
                alias nano="nano --rcfile ${OSH_HOME:-$HOME}/.nanorc"
            fi
            ;;
        vim)
            if [[ -e ${OSH_HOME:-$HOME}/.vimrc ]]; then
                alias vim="vim -u ${OSH_HOME:-$HOME}/.vimrc"
            fi
            ;;
    esac
fi

if [[ -n $EDITOR ]]; then
    alias e=$EDITOR
fi

alias ip='ip --color'
unalias less

export BAT_THEME="Solarized (dark)"
function _omb_aliases_general_extra_batcat {
    if [[ $# -lt 3 ]]; then
        return 1
    fi

    local plain=$1
    local language=$2

    if [[ ${plain} == "true" ]]; then
        batcat --plain --language=${language} "${@:3}"
    else
        batcat --language=${language} "${@:3}"
    fi
}
alias b='batcat'
alias bl='_omb_aliases_general_extra_batcat false'
alias bp='batcat --plain'
alias blp='_omb_aliases_general_extra_batcat true'
alias cat='batcat --paging=never --plain'

function _omb_aliases_general_calculator {
    echo "$@" | bc -l
}
alias calculator='_omb_aliases_general_calc'

function _omb_aliases_general_shorten_url {
    curl -L -k -s -w "\n" http://tinyurl.com/api-create.php?url=${1}
}
alias shorten-url='_omb_aliases_general_shorten_url'

function _omb_aliases_general_wttr {
    local city=${LC_CITY:-"Berlin"}
    curl -H "Accept-Language: ${LC_MESSAGES%_*}" "https://wttr.in/${1:-$city}?format=4"
}
alias wttr='_omb_aliases_general_wttr'
