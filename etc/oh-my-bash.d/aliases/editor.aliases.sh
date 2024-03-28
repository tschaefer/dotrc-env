#! bash oh-my-bash.module

case $EDITOR in
    nano)
        if [[ -e ${OSH_HOME:-$HOME}/.nanorc ]]; then
            alias nano="nano --rcfile ${OSH_HOME:-$HOME}/.nanorc"
        fi
        ;;
    vim)
        if [[ -e ${OSH_HOME:-$HOME}/.vimrc ]]; then
            alias vim="vim -u ${OSH_HOME:-$HOME}/.vimrc"
        fi
        ;;
esac
