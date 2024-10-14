#! bash oh-my-bash.module

SCM_GIT_SHOW_DETAILS="false"

SCM_THEME_PROMPT_PREFIX="${_omb_prompt_olive}["
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_olive}]${_omb_prompt_normal}"
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_normal}${_omb_prompt_red}-${_omb_prompt_normal}"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_normal}${_omb_prompt_green}+${_omb_prompt_normal}"
SCM_THEME_BRANCH_PREFIX="branch:"

SCM_GIT_AHEAD_CHAR=">"
SCM_GIT_BEHIND_CHAR="<"

PROMPT_DIRTRIM=3

function _omb_theme_foobar_PROMPT_COMMAND {
    if [[ $? -eq 0 ]]; then
        local symbol=">>"
    else
        local symbol="${_omb_prompt_red}>>${_omb_prompt_normal}"
    fi

    local cmd
    local host
    local dir
    local emoji

    cmd=$(ps -A -o pid,comm | awk -v ppid=$PPID '$1 == ppid { print $2 }')
    cmd=$(basename "${cmd:-$SHELL}")
    if _omb_prompt_get_virtualenv; then
        cmd="${cmd}+"
    fi
    if [[ ${EUID} -eq 0 ]]; then
        cmd="${_omb_prompt_red}${cmd}${_omb_prompt_normal}"
    fi
    host="${_omb_prompt_navy}[\h:${cmd}]${_omb_prompt_normal}"
    dir="${_omb_prompt_lime}[\w]${_omb_prompt_normal}"

    if [[ -e ${OSH_HOME}/.emoji ]]; then
        emoji=" $(cat ${OSH_HOME}/.emoji) "
    else
        emoji=" "
    fi

    PS1="${host} ${dir}${emoji}$(scm_prompt_info)\n ${symbol} "
    PS2=" %> "
}

_omb_util_add_prompt_command _omb_theme_foobar_PROMPT_COMMAND

