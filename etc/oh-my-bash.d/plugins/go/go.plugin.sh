#! bash oh-my-bash.module

if [[ ! -d ${OSH_HOME:-$HOME}/.goenv ]]; then
    return 1
fi

if [[ ${EUID} == 0 ]]; then
    export PATH=${OSH_HOME:-$HOME}/.goenv/bin:${PATH}
else
    export PATH=${OSH_HOME:-$HOME}/.goenv/bin:${PATH}
    export GOENV_AUTOMATICALLY_DETECT_VERSION=1
    export GOENV_GOPATH_PREFIX=${OSH_HOME:-$HOME}/.go
    eval "$(goenv init -)"
fi


function _omb_plugin_go_analyze {
    [ $# -lt 1 ] && return 1

    go vet -vettool=${GOPATH}/bin/$1 ./...
}

alias goanalyze="_omb_plugin_go_analyze"
