unset -f upgrade_oh_my_bash

function _omb_exec_usage {
    local ME="oh-my-bash"
cat <<EOF
Usage:
    $ME help
    $ME reload | reexec
    $ME list COMPONENTS
    $ME info COMPONENT NAME
    $ME upgrade

Actions:
    help:       shows this message (help)
    reload:     reload the shell
    reexec:     reexec the shell
    list:       list components: plugins, completions, aliases, themes
    info:       show component information: plugin, theme
    upgrade:    upgrade Oh My Bash

EOF
}

function _omb_exec_banner {
    printf '%s' ${_omb_term_green}
    printf '%s\n' \
        '         __                          __               __  ' \
        '  ____  / /_     ____ ___  __  __   / /_  ____ ______/ /_ ' \
        ' / __ \/ __ \   / __ `__ \/ / / /  / __ \/ __ `/ ___/ __ \' \
        '/ /_/ / / / /  / / / / / / /_/ /  / /_/ / /_/ (__  ) / / /' \
        '\____/_/ /_/  /_/ /_/ /_/\__, /  /_.___/\__,_/____/_/ /_/ ' \
        '                        /____/                            '
    printf '%s' ${_omb_term_normal}
}

function _omb_exec_help {
    _omb_exec_banner
    _omb_exec_usage
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

            local available_plugins=()
            readarray -t available_plugins < <(find ${OSH}/plugins ${OSH_CUSTOM}/plugins \
                -type f -name "*.plugin.*sh")

            local plugin
            for plugin in "${available_plugins[@]}"; do
                local path
                path=$(dirname "$plugin")
                plugin=$(basename "$plugin" | sed -E 's/.plugin.(bash|sh)//')

                local installed=''
                if echo "${plugins[*]}" | grep -wq "${plugin}"; then
                    installed="${_omb_term_green}✓${_omb_term_normal}"
                fi

                local readme=''
                if [[ -e "${path}/README.md" ]]; then
                    readme="${_omb_term_olive}®${_omb_term_normal}"
                fi

                echo "$plugin $readme $installed"
            done
            ;;
        completions)
            echo "${_omb_term_navy}List Oh My Bash completions${_omb_term_normal}"
            _omb_exec_banner

            local available_completions=()
            readarray -t available_completions < <(find ${OSH}/completions ${OSH_CUSTOM}/completions \
                -type f -name "*.completion.*sh" -exec basename '{}' \; | \
                sed -E 's/.completion.(bash|sh)//')

            local completion
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

            local available_aliases=()
            readarray -t available_aliases < <(find ${OSH}/aliases ${OSH_CUSTOM}/aliases \
                -type f -name "*.aliases.*sh" -exec basename '{}' \; | \
                sed -E 's/.aliases.(bash|sh)//')

            local alias
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

            local themes=()
            readarray -t available_themes < <(find ${OSH}/themes ${OSH_CUSTOM}/themes \
                -type f -name "*.theme.*sh")

            local theme
            for theme in "${available_themes[@]}"; do
                local path
                path=$(dirname "$theme")
                theme=$(basename "$theme" | sed -E 's/.theme.(bash|sh)//')

                local installed=''
                if [[ "$theme" == "${OSH_THEME}" ]]; then
                    installed="${_omb_term_green}✓${_omb_term_normal}"
                fi

                local readme=''
                if [[ -e "${path}/README.md" ]]; then
                    readme="${_omb_term_olive}®${_omb_term_normal}"
                fi

                echo "$theme $readme $installed"
            done
            ;;
        *)
            _omb_exec_usage >&2
            return 1
            ;;
    esac
}

function _omb_exec_info_component {
    if [[ $# -lt 2 ]]; then
        _omb_exec_usage >&2
        return 1
    fi

    local component=$1
    local name=$2

    local locations=()
    case $component in
        plugin)
            locations=({"$OSH_CUSTOM","$OSH"}/plugins/"$name")
            ;;
        theme)
            locations=({"$OSH_CUSTOM","$OSH"}/themes/"$name")
            ;;
        *)
            _omb_exec_usage >&2
            return 1
            ;;
    esac

    local location
    for location in "${locations[@]}"; do
        if [[ -e "${location}/README.md" ]]; then
            local pager
            if _omb_util_binary_exists "batcat"; then
                pager="batcat --plain"
            elif _omb_util_binary_exists "bat"; then
                pager="bat --plain"
            elif [[ -n $PAGER ]]; then
                pager="$PAGER"
            else
                pager="cat"
            fi

            ${pager} "${location}/README.md"
            return 0
        fi
    done

    return 1
}

function _omb_exec {
    if [[ $# -lt 1 ]]; then
        _omb_exec_usage >&2
        return 1
    fi

    case $1 in
        help)
            _omb_exec_help
            ;;
        info)
            _omb_exec_info_component $2 $3
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

function omb {
    _omb_exec "$@"
}

function _omp_exec_completion {
    if [[ "${#COMP_WORDS[@]}" -gt 3 ]]; then
        return
    fi

    local cur prev
    _get_comp_words_by_ref -n : cur prev

    if [[ $prev == "list" ]]; then
        mapfile -t COMPREPLY < <(compgen -W "plugins completions aliases themes" -- "$cur")
        return
    fi

    if [[ $prev == "info" ]]; then
        mapfile -t COMPREPLY < <(compgen -W "plugin theme" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "help info list reexec reload upgrade" -- "$cur")
}
complete -F _omp_exec_completion omb

alias oh-my-bash='omb'
complete -F _complete_alias oh-my-bash
alias osh='omb'
complete -F _complete_alias osh
