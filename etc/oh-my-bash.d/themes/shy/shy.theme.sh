#! bash oh-my-bash.module

SCM_THEME_PROMPT_PREFIX="${_omb_prompt_olive}"
SCM_THEME_PROMPT_SUFFIX=" "
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_normal}${_omb_prompt_red}✗${_omb_prompt_normal}"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_normal}${_omb_prompt_green}✓${_omb_prompt_normal}"

PROMPT_DIRTRIM=0

function _omb_theme_shy_PROMPT_COMMAND {
    if [[ $? -eq 0 ]]; then
        local symbol="└➜ "
    else
        local symbol="└${_omb_prompt_red}➜ ${_omb_prompt_normal}"
    fi

    local cmd
    local host
    local dir

    cmd=$(ps -A -o pid,comm | awk -v ppid=$PPID '$1 == ppid { print $2 }')
    cmd=$(basename ${cmd:-$SHELL})
    if [[ ${EUID} -eq 0 ]]; then
        cmd="${_omb_prompt_red}${cmd}${_omb_prompt_normal}"
    fi
    host="${_omb_prompt_navy}\h:${cmd}${_omb_prompt_normal}"
    dir="${_omb_prompt_lime}\w${_omb_prompt_normal}"

    PS1="┍ ${host} ${dir} $(scm_prompt_info)\n${symbol}"
    PS2=" %> "
}

_omb_util_add_prompt_command _omb_theme_shy_PROMPT_COMMAND

