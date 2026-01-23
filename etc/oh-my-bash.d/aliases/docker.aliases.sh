#! bash oh-my-bash.module

alias docls='docker container list --format "table {{.Names}}\t{{.Status}}"'
alias docipv4='docker container inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
alias docipv6='docker container inspect --format "{{range .NetworkSettings.Networks}}{{.GlobalIPv6Address}}{{end}}"'
alias doils='docker image list --format "table {{.Repository}}\t{{.Tag}}"'
