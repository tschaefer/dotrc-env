#! bash oh-my-bash.module

if [[ -d ${OSH_HOME:-$HOME}/.rbenv ]]; then
    if [[ ${EUID} == 0 ]]; then
        export PATH=${OSH_HOME:-$HOME}/.rbenv/shims:${PATH}
    else
        export PATH=${OSH_HOME:-$HOME}/.rbenv/bin:${PATH}
        eval "$(rbenv init - bash)"

        # TODO: Remove this once rbenv is fixed
        rm -f ${OSH_HOME:-$HOME}/.rbenv/shims/*.lock 2>/dev/null
    fi
fi
