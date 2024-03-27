_deepl_translate() {
    local cur prev words
    _get_comp_words_by_ref cur prev words cword

    local options='--help --language-from --language-to'
    local language_from='BG CS DA DE EL EN ES ET FI FR HU ID IT JA KO LT LV NB NL PL PT RO RU SK SL SV TR UK ZH'
    local language_to='BG CS DA DE EL EN-GB EN-US ES ET FI FR HU ID IT JA KO LT LV NB NL PL PT-BR PT-PT RO RU SK SL SV TR UK ZH'

    case $prev in
        --help)
            return
            ;;
        --language-from)
            mapfile -t COMPREPLY < <(compgen -W "${language_from}" -- "$cur")
            return
            ;;
        --language-to)
            mapfile -t COMPREPLY < <(compgen -W "${language_to}" -- "$cur")
            return
            ;;
    esac

    if [[ $cur == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi
}

_deepl() {
    local cur prev words
    _get_comp_words_by_ref cur prev words cword

    local actions='translate usage'
    local options='--help --man --version --configuration-file'

    for word in "${words[@]}"; do
        case $word in
            translate)
                _deepl_translate
                return
                ;;
            usage)
                return
                ;;
        esac
    done

    case $prev in
        --help|--man|--version)
            return
            ;;
        --configuration-file)
            _filedir
            return
            ;;
    esac

    if [[ $cur == -* ]]; then
        mapfile -t COMPREPLY < <(compgen -W "${options}" -- "$cur")
        return
    fi

    mapfile -t COMPREPLY < <(compgen -W "${actions}" -- "$cur")
}

complete -F _deepl deepl

# vim: ft=sh
