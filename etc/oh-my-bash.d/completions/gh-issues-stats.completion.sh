_github_issues_info() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local info='--help --man --version'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${info}" -- "$cur")
        return
    fi
}

_github_issues_labels() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    case "$prev" in
        --help|--man|--version)
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${info}" -- "$cur")
        return
    fi
}

_github_issues_period() {
    local cur prev
    _get_comp_words_by_ref -n : cur prev

    local options='--label --finished --format --legend --pager'
    local info='--help --man --version'
    local formats='table chart json'

    case "$prev" in
        --help|--man|--version)
            return
            ;;
        --format)
            mapfile -t COMPREPLY < <(compgen -W "${formats}" -- "$cur")
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi
}


_github_issues() {
    local cur prev words
    _get_comp_words_by_ref -n : cur prev words

    local commands="yearly monthly labels"
    local options='--configuration-file --cache-path --refresh'
    local info='--help --man --version'

    for word in "${words[@]}"; do
        case "$word" in
            yearly|monthly)
                _github_issues_period
                return
                ;;
            labels)
                _github_issues_labels
                return
                ;;
        esac
    done

    case "$prev" in
        --help|--man|--version|--refresh)
            return
            ;;
        --configuration-file|--cache-path)
            _filedir
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options} ${info}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${commands}" -- "$cur")

    return

}

complete -F _github_issues gh-issues-stats

# vim: ft=bash
