#! bash oh-my-bash.module

alias battery='acpi -b'

alias ipas='ip --color addr show'
alias ipr='ip --color route show'
alias ipl='ip --color link show'

alias gdnp='command git --no-pager diff'

alias vim-notags="vim --cmd 'let g:gutentags_enabled = 0'"

unalias less

function _omb_aliases_general_calculator {
    echo "$@" | bc
}
alias calculator='_omb_aliases_general_calculator'

function _omb_aliases_general_shorten_url {
    exec 3< <(curl --silent --location --write-out "\n" \
        https://tinyurl.com/api-create.php?url="${1}")
    spinner

    cat <&3
}
alias shorten-url='_omb_aliases_general_shorten_url'

function _omb_aliases_general_wttr {
    local station=${WTTR_STATION:-"Garmisch-Partenkirchen"}

    exec 3< <(curl --silent --location --write-out "\n" \
        --compressed --header "Accept-Language: ${LC_MESSAGES%_*}" \
        "https://wttr.in/${1:-$station}?format=%l:%20%C,%20%t,%20%w")
    spinner

    echo "🛰️  $(cat <&3)"
}
alias wttr='_omb_aliases_general_wttr'

function _omb_aliases_general_gitignore {
    exec 3< <(curl --silent --location --write-out "\n" \
        "https://www.toptal.com/developers/gitignore/api/$*")
    spinner

    cat <&3
}
alias gi='_omb_aliases_general_gitignore'

function _omb_aliases_general_ident_me {
    local version=${1:-4}

    exec 3< <(curl --silent --location --write-out "\n" \
        https://${version}.ident.me)
    spinner

    cat <&3
}
alias ipv4='_omb_aliases_general_ident_me 4'
alias ipv6='_omb_aliases_general_ident_me 6'
