unset -f upgrade_oh_my_bash

function _omb_exec_usage {
cat <<EOF
Usage:
    $ME help | reload | reexec | list COMPONENT

Actions:
    help:       shows this message (help)
    reload:     reload the shell
    reexec:     reexec the shell
    list:       list components: plugins, completions, aliases, themes

EOF
}

function _omb_exec_banner {
    GREEN=$(tput setaf 2 2>/dev/null || tput AF 2 2>/dev/null)
    NORMAL=$(tput sgr0 2>/dev/null || tput me 2>/dev/null)

    printf '%s' "$GREEN"
    # shellcheck disable=SC1003,SC2016
    printf '%s\n' \
        '         __                          __               __  ' \
        '  ____  / /_     ____ ___  __  __   / /_  ____ ______/ /_ ' \
        ' / __ \/ __ \   / __ `__ \/ / / /  / __ \/ __ `/ ___/ __ \' \
        '/ /_/ / / / /  / / / / / / /_/ /  / /_/ / /_/ (__  ) / / /' \
        '\____/_/ /_/  /_/ /_/ /_/\__, /  /_.___/\__,_/____/_/ /_/ ' \
        '                        /____/                            '
    printf '%s' "$NORMAL"
}

function _omb_exec_upgrade {
    source "$OSH"/tools/upgrade.sh
}

function _omb_exec_reload {
    echo "${_omb_term_navy}Reloading Oh My Bash${_omb_term_normal}"
    _omb_exec_banner
    _omb_module_require_plugin "${plugins[@]}"
    _omb_module_require_alias "${aliases[@]}"
    _omb_module_require_completion "${completions[@]}"
}

function _omb_exec_reexec {
    echo "${_omb_term_navy}Reexecuting Oh My Bash${_omb_term_normal}"
    _omb_exec_banner
    exec bash
}

function _omb_exec_list_components {
    local components=$1
    if [[ -z $components ]]; then
        _omb_exec_usage >&2
        return 1
    fi

    case $components in
        plugins)
            echo "${_omb_term_navy}List Oh My Bash plugins${_omb_term_normal}"
            _omb_exec_banner
            readarray -t available_plugins < <(find ${OSH}/plugins ${OSH_CUSTOM}/plugins \
                -type f -name "*.plugin.*sh" -exec basename '{}' \; | sort -u | \
                sed -E 's/.plugin.(bash|sh)//')

            for plugin in "${available_plugins[@]}"; do
                if echo "${plugins[*]}" | grep -wq "${plugin}"; then
                    echo "$plugin ${_omb_term_green}✓${_omb_term_normal}"
                else
                    echo "$plugin"
                fi
            done
            ;;
        completions)
            echo "${_omb_term_navy}List Oh My Bash completions${_omb_term_normal}"
            _omb_exec_banner
            readarray -t available_completions < <(find ${OSH}/completions ${OSH_CUSTOM}/completions \
                -type f -name "*.completion.*sh" -exec basename '{}' \; | sort -u | \
                sed -E 's/.completion.(bash|sh)//')

            for completion in "${available_completions[@]}"; do
                if echo "${completions[*]}" | grep -wq "${completion}"; then
                    echo "$completion ${_omb_term_green}✓${_omb_term_normal}"
                else
                    echo "$completion"
                fi
            done
            ;;
        aliases)
            echo "${_omb_term_navy}List Oh My Bash aliases${_omb_term_normal}"
            _omb_exec_banner
            readarray -t available_aliases < <(find ${OSH}/aliases ${OSH_CUSTOM}/aliases \
                -type f -name "*.aliases.*sh" -exec basename '{}' \; | sort -u | \
                sed -E 's/.aliases.(bash|sh)//')

            for alias in "${available_aliases[@]}"; do
                if echo "${aliases[*]}" | grep -wq "${alias}"; then
                    echo "$alias ${_omb_term_green}✓${_omb_term_normal}"
                else
                    echo "$alias"
                fi
            done
            ;;
        themes)
            echo "${_omb_term_navy}List Oh My Bash themes${_omb_term_normal}"
            _omb_exec_banner
            readarray -t available_themes < <(find ${OSH}/themes ${OSH_CUSTOM}/themes \
                -type f -name "*.theme.*sh" -exec basename '{}' \; | sort -u | \
                sed -E 's/.theme.(bash|sh)//')

            for theme in "${available_themes[@]}"; do
                if [[ "$theme" == "${OSH_THEME}" ]]; then
                    echo "$theme ${_omb_term_green}✓${_omb_term_normal}"
                else
                    echo "$theme"
                fi
            done
            ;;
        *)
            _omb_exec_usage >&2
            return 1
            ;;
    esac
}

function _omb_exec {
    if [[ $# -lt 1 ]]; then
        _omb_exec_usage >&2
        return 1
    fi

    case $1 in
        help)
            _omb_exec_usage
            ;;
        list)
            _omb_exec_list_components $2
            ;;
        reexec)
            _omb_exec_reexec
            ;;
        reload)
            _omb_exec_reload
            ;;
        upgrade)
            _omb_exec_upgrade
            ;;
        *)
            _omb_exec_usage >&2
            return 1
            ;;
    esac
}

function _omp_exec_completion {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    if [[ $prev == "list" ]]; then
        mapfile -t COMPREPLY < <(compgen -W "plugins completions aliases themes" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "help list reexec reload upgrade" -- "$cur")
}
complete -F _omp_exec_completion _omb_exec

alias oh-my-bash='_omb_exec'
complete -F _complete_alias oh-my-bash
alias omb='_omb_exec'
complete -F _complete_alias omb
alias osh='_omb_exec'
complete -F _complete_alias osh
