#! bash oh-my-bash.module

alias ip='ip --color'
unalias less

function _omb_aliases_general_calculator {
    echo "$@" | bc -l
}
alias calculator='_omb_aliases_general_calculator'

function _omb_aliases_general_shorten_url {
    curl -L -k -s -w "\n" http://tinyurl.com/api-create.php?url=${1}
}
alias shorten-url='_omb_aliases_general_shorten_url'

function _omb_aliases_general_wttr {
    local city=${ADDRESS_CITY:-"Berlin"}
    curl --silent --header "Accept-Language: ${LC_MESSAGES%_*}" "https://wttr.in/${1:-$city}?format=4"
}
alias wttr='_omb_aliases_general_wttr'
