#! bash oh-my-bash.module

SCM_GIT_SHOW_MINIMAL_INFO=true

SCM_THEME_BRANCH_PREFIX="${_omb_prompt_olive}branch:${_omb_prompt_normal}"
SCM_THEME_TAG_PREFIX="${_omb_prompt_olive}tag:${_omb_prompt_normal}"
SCM_THEME_DETACHED_PREFIX="${_omb_prompt_olive}detached:${_omb_prompt_normal}"
SCM_THEME_PROMPT_PREFIX=" ${_omb_prompt_white}(${_omb_prompt_normal}"
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_white})${_omb_prompt_normal}"
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_red}✗${_omb_prompt_normal}"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_green}✓${_omb_prompt_normal}"

function _omb_theme_PROMPT_COMMAND {
    if [[ $? -eq 0 ]]; then
        local symbol="»"
    else
        local symbol="${_omb_prompt_red}»${_omb_prompt_normal}"
    fi

    local cmd
    local who
    local host
    local dir

    cmd=$(ps -A -o pid,comm | awk -v ppid=$PPID '$1 == ppid { print $2 }')
    cmd=$(basename ${cmd:-$SHELL})
    # shellcheck disable=SC2154
    cmd="${_omb_prompt_olive}${cmd}${_omb_prompt_normal}"

    if [[ ${EUID} -eq 0 ]]; then
        who="${_omb_prompt_red}\u${_omb_prompt_normal}"
        PS2="root %> "
    else
        who="${_omb_prompt_white}\u${_omb_prompt_normal}"
        PS2="%> "
    fi
    # shellcheck disable=SC2154
    host="${_omb_prompt_navy}\h${_omb_prompt_normal}"
    # shellcheck disable=SC2154
    dir="${_omb_prompt_teal}\w${_omb_prompt_normal}"

    PS1="${who}@${host}:${cmd}$(scm_prompt_info) ${dir}
 ${symbol} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
