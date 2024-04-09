#! bash oh-my-bash.module

alias battery='acpi -b'

alias ipas='ip --color addr show'
alias ipr='ip --color route show'
alias ipl='ip --color link show'

unalias less

function _omb_aliases_general_calculator {
    echo "$@" | bc -l
}
alias calculator='_omb_aliases_general_calculator'

function _omb_aliases_general_shorten_url {
    curl --silent --location --write-out "\n" https://tinyurl.com/api-create.php?url="${1}"
}
alias shorten-url='_omb_aliases_general_shorten_url'

function _omb_aliases_general_wttr {
    local city=${ADDRESS_CITY:-"Berlin"}
    curl --silent --location --write-out "\n" \
        --compressed --header "Accept-Language: ${LC_MESSAGES%_*}" \
        "https://wttr.in/${1:-$city}?format=%l:%20%C,%20%t,%20%w"
}
alias wttr='_omb_aliases_general_wttr'
