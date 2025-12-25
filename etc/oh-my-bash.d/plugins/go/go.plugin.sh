#! bash oh-my-bash.module

if ! _omb_util_binary_exists go; then
    return 0
fi

export GOPATH="${OSH_HOME:-$HOME}/.go"
export PATH=${OSH_HOME:-$HOME}/.go/bin:${PATH}

function _omb_plugin_go_analyze {
    [ $# -lt 1 ] && return 1

    go vet -vettool=${GOPATH}/bin/$1 ./...
}

alias goanalyze="_omb_plugin_go_analyze"
