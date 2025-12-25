#! bash oh-my-bash.module

export HISTIGNORE="${HISTIGNORE}:smite"

function _omb_plugin_smite {
    local entries
    entries=$(fc -l 1 | fzf --no-sort --tac --multi --smart-case) || return

    local line_nums
    line_nums=$(awk '{print $1}' <<< "$entries" | sort -rn)

    while IFS= read -r lineno; do
        history -d "$lineno"
    done <<< "$line_nums"

    history -w
}

alias smite="_omb_plugin_smite"
