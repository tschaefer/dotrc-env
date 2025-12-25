#! bash oh-my-bash.module

if [[ -e ${OSH_HOME:-$HOME}/.nanorc ]]; then
    alias nano="nano --rcfile ${OSH_HOME:-$HOME}/.nanorc"
fi
if [[ -e ${OSH_HOME:-$HOME}/.vimrc ]]; then
    alias vim="vim -u ${OSH_HOME:-$HOME}/.vimrc"
fi
