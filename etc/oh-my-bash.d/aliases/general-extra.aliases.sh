#! bash oh-my-bash.module

alias battery='acpi -b'

alias ipas='ip --color addr show'
alias ipr='ip --color route show'
alias ipl='ip --color link show'

complete -F _complete_alias ipas
complete -F _complete_alias ipr
complete -F _complete_alias ipl

alias vim-notags="vim --cmd 'let g:gutentags_enabled = 0'"

unalias less
unalias -- -
unalias ..
unalias ...
unalias .3
unalias .4
unalias .5
unalias .6
unalias 000
unalias 1
unalias 2
unalias 3
unalias 4
unalias 5
unalias 6
unalias 640
unalias 644
unalias 7
unalias 755
unalias 775
unalias 8
unalias 9
unalias _
unalias afind

function _omb_aliases_general_calculator {
    echo "$@" | bc
}
alias calculator='_omb_aliases_general_calculator'

function _omb_aliases_general_shorten_url {
    exec 3< <(curl --silent --location --write-out "\n" \
        https://tinyurl.com/api-create.php?url="${1}")
    if [[ -t 1 ]]; then
        spinner
    fi

    cat <&3
}
alias shorten-url='_omb_aliases_general_shorten_url'

function _omb_aliases_general_wttr {
    local station=${WTTR_STATION:-"Garmisch-Partenkirchen"}

    exec 3< <(curl --silent --location --write-out "\n" \
        --compressed --header "Accept-Language: ${LC_MESSAGES%_*}" \
        "https://wttr.in/${1:-$station}?format=%l:%20%C,%20%t")
    if [[ -t 1 ]]; then
        spinner
    fi

    echo "🛰️  $(cat <&3)"
}
alias wttr='_omb_aliases_general_wttr'

function _omb_aliases_general_gitignore {
    exec 3< <(curl --silent --location --write-out "\n" \
        "https://www.toptal.com/developers/gitignore/api/$*")
    if [[ -t 1 ]]; then
        spinner
    fi

    cat <&3
}
alias gi='_omb_aliases_general_gitignore'

function _omb_aliases_general_git_status_modified {
    git status --porcelain | awk '/^[^?]/ {print "\033[31m"$1"\033[0m" " " $2 }'
}
alias gssm='_omb_aliases_general_git_status_modified'
alias gdnp='command git --no-pager diff'

function _omb_aliases_general_ident_me {
    local version=${1:-4}

    exec 3< <(curl --silent --location --write-out "\n" \
        https://${version}.ident.me)
    if [[ -t 1 ]]; then
        spinner
    fi

    cat <&3
}
alias ipv4='_omb_aliases_general_ident_me 4'
alias ipv6='_omb_aliases_general_ident_me 6'

function _omb_aliases_general_ps {
    ps -ax -o pid= -o command= | grep -v ']$' | grep -v -E '[0-9]+ (ps|grep)'
}
alias psl='_omb_aliases_general_ps'
alias psq='_omb_aliases_general_ps | grep'
