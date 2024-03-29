#! bash oh-my-bash.module

alias apdu='sudo apt dist-upgrade'
alias aparp='sudo apt autoremove --purge'
alias apsen='sudo apt search --names-only'

function _omb_aliases_dpkg_list_short {
    dpkg -l | tail -n +6 | awk '{ print $2 }'
}
alias dls=_omb_aliases_dpkg_list_short
alias dlsq="_omb_aliases_dpkg_list_short | grep "

if _omb_util_command_exists apt-file; then
    alias apff='apt-file find'

    function _omb_aliases_apt_file_find_executable {
        apt-file find $1 | grep "bin/${1}$"
    }
    alias apffe="_omb_aliases_apt_file_find_executable"
fi
