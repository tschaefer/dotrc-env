#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.cargo/bin ]]; then
    export PATH=${OSH_HOME:-$HOME}/.cargo/bin:${PATH}
fi
