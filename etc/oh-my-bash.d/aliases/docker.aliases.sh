#! bash oh-my-bash.module

alias docls='docker container list --format "table {{.Names}}\t{{.Status}}"'
alias doils='docker image list --format "table {{.Repository}}\t{{.Tag}}"'
