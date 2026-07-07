#! bash oh-my-bash.module

if ! _omb_util_binary_exists "zellij"; then
    return
fi

export ZELLIJ_CONFIG_DIR=${ZELLIJ_CONFIG_DIR:-"${OSH_HOME}/.zellij"}
source <(zellij setup --generate-completion bash)
