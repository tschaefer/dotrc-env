#! bash oh-my-bash.module

SCM_THEME_PROMPT_PREFIX="${_omb_prompt_navy}[${_omb_prompt_normal}"
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_navy}]${_omb_prompt_normal}"
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_red}✗${_omb_prompt_normal}"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_green}✓${_omb_prompt_normal}"

PROMPT_DIRTRIM=0

function _omb_theme_foobar_PROMPT_COMMAND {
    if [[ $? -eq 0 ]]; then
        if [[ ${EUID} -eq 0 ]]; then
            local symbol="root ➜ "
        else
            local symbol="➜ "
        fi
    else
        if [[ ${EUID} -eq 0 ]]; then
            local symbol="${_omb_prompt_red}root ➜ ${_omb_prompt_normal}"
        else
            local symbol="${_omb_prompt_red}➜ ${_omb_prompt_normal}"
        fi
    fi

    local cmd
    local host
    local dir
    local scm

    cmd=$(ps -A -o pid,comm | awk -v ppid=$PPID '$1 == ppid { print $2 }')
    cmd=$(basename ${cmd:-$SHELL})
    host="${_omb_prompt_navy}[\h:${cmd}]${_omb_prompt_normal}"
    dir="${_omb_prompt_lime}[\w]${_omb_prompt_normal}"

    PS1="${host}${dir}$(scm_prompt_info)
 ${symbol}"
}

_omb_util_add_prompt_command _omb_theme_foobar_PROMPT_COMMAND

