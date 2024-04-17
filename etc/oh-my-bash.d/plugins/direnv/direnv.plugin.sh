#! bash oh-my-bash.module

if ! _omb_util_binary_exists "direnv"; then
    return
fi

function _omb_plugin_direnv_completion {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local actions="allow permit grant block deny revoke edit exec fetchurl \
        help hook prune reload status stdlib version"

    if echo "${actions}" | grep --word-regexp --quiet "${prev}"; then
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
}
complete -F _omb_plugin_direnv_completion direnv

eval "$(direnv hook bash)"
