#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.phpenv ]]; then
    if [[ ${EUID} == 0 ]]; then
        export PATH=${OSH_HOME:-$HOME}/.phpenv/shims:${PATH}
    else
        export PATH=${OSH_HOME:-$HOME}/.phpenv/bin:${PATH}
        eval "$(phpenv init - --no-rehash bash)"
    fi
fi
