#! bash oh-my-bash.module

if [[ -r ${OSH_HOME:-$HOME}/.perlbrew/etc/bashrc ]]; then
    . ${OSH_HOME:-$HOME}/.perlbrew/etc/bashrc
    export PERLBREW_HOME=${OSH_HOME:-$HOME}/.perlbrew
fi
