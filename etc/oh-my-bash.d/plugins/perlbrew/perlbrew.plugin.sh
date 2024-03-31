#! bash oh-my-bash.module

if [[ -r ${OSH_HOME:-$HOME}/.perlbrew/etc/bashrc ]]; then
    source "${OSH_HOME:-$HOME}/.perlbrew/etc/bashrc"
    export PERLBREW_HOME=${OSH_HOME:-$HOME}/.perlbrew
fi
