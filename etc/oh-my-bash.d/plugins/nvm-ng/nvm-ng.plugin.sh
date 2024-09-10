#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.nvm ]]; then
    export NVM_DIR="${OSH_HOME:-$HOME}/.nvm"

    if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
        source "${NVM_DIR}/nvm.sh"
    fi

    if [[ -s "${NVM_DIR}/bash_completion" ]]; then 
        source "${NVM_DIR}/bash_completion"
    fi

    NODE_VERSION=$(node --version default)
    export PATH=${NVM_DIR}/versions/node/${NODE_VERSION}/lib/node_modules/corepack/shims:${PATH}
fi
