#! bash oh-my-bash.module

if _omb_util_binary_exists go; then
    export GOPATH="${OSH_HOME:-$HOME}/.go"
    export PATH=${OSH_HOME:-$HOME}/.go/bin:${PATH}
fi
