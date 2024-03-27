#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.nvm ]]; then
    export NVM_DIR="${OSH_HOME:-$HOME}/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    NODE_VERSION=$(node --version default)
    export PATH=${NVM_DIR}/versions/node/${NODE_VERSION}/lib/node_modules/corepack/shims:${PATH}
fi
