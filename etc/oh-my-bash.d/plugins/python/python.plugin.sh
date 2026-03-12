#! bash oh-my-bash.module

if [[ ! -d ${OSH_HOME:-$HOME}/.pyenv ]]; then
    return 1
fi

if [[ ${EUID} == 0 ]]; then
    export PATH=${OSH_HOME:-$HOME}/.pyenv/bin:${PATH}
else
    export PYENV_ROOT=${OSH_HOME:-$HOME}/.pyenv
    export PATH=${OSH_HOME:-$HOME}/.pyenv/bin:${PATH}
    eval "$(pyenv init - bash)"
fi
