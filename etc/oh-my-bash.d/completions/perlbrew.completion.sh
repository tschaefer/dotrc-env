_list_perls() {
    local _perls=$1
    local __perls="$(perlbrew available)"
    eval $_perls="'${__perls//i}'"
}

_list_local_perls() {
    [ ! -d $PERLBREW_ROOT/perls ] && return
    local _perls=$1
    local __perls=$(ls -1 $PERLBREW_ROOT/perls/)
    eval $_perls="'${__perls}'"
}

_list_local_libs() {
    [ ! -d $PERLBREW_ROOT/libs ] && return
    local _libs=$1
    local __libs=$(ls -1 $PERLBREW_ROOT/libs)
    eval $_libs="'${__libs}'"
}

_list_local_perls_libs() {
    local _perls_libs=$1
    local perls libs
    _list_local_perls perls
    _list_local_libs libs
    local __perls_libs="${perls} ${libs}"
    eval $_perls_libs="'${__perls_libs//\*}'"
}

_list_local_aliases() {
    local _aliases=$1
    local perls __aliases
    _list_local_perls perls
    _list_local_libs libs
    for perl in ${perls}; do
        if [[ -L $PERLBREW_ROOT/perls/${perl} ]]; then
            __aliases="${__aliases} ${perl}"
        fi
    done
    eval $_aliases="'${__aliases}'"
}

_perlbrew() {
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword

    if [[ $cword == 1 ]]; then
        COMPREPLY=( $(command perlbrew compgen $COMP_CWORD ${COMP_WORDS[*]}) )
        return 0
    fi

    if [[ $cword == 2 ]]; then
        case "$prev" in
            install|install-multiple|download)
                local perls
                _list_perls perls
                COMPREPLY=($(compgen -W "${perls}" -- "$cur"))
                return 0
                ;;
            uninstall)
                local perls
                _list_local_perls perls
                COMPREPLY=($(compgen -W "${perls}" -- "$cur"))
                return 0
                ;;
            lib)
                COMPREPLY=($(compgen -W "create delete list" -- "$cur"))
                return 0
                ;;
            lib-create|lib-delete)
                _list_local_perls perls
                COMPREPLY=($(compgen -W "${perls}" -- "$cur"))
                ;;
            alias)
                COMPREPLY=($(compgen -W "create rename delete" -- "$cur"))
                return 0
                ;;
            switch)
                local perls_libs
                _list_local_perls_libs perls_libs
                COMPREPLY=($(compgen -W "${perls_libs} off" -- "$cur"))
                return 0
                ;;
            use)
                local perls_libs
                _list_local_perls_libs perls_libs
                COMPREPLY=($(compgen -W "${perls_libs}" -- "$cur"))
                return 0
                ;;
            help)
                COMPREPLY=($(compgen -W "${actions}" -- "$cur"))
                return 0
                ;;
            *)
                return 0
                ;;
        esac
    fi

    if [[ $cword == 3 ]]; then
        local action=${words[1]}
        case "${action}" in
            lib)
                case "${prev}" in
                    create)
                        local perls
                        _list_local_perls perls
                        COMPREPLY=($(compgen -W "${perls}" -- "$cur"))
                        ;;
                    delete)
                        local libs
                        _list_local_libs libs
                        COMPREPLY=($(compgen -W "${libs}" -- "$cur"))
                        ;;
                esac
                return 0
                ;;
            alias)
                case "${prev}" in
                    create)
                        local perls
                        _list_local_perls perls
                        COMPREPLY=($(compgen -W "${perls}" -- "$cur"))
                        ;;
                    delete|rename)
                        local aliases
                        _list_local_aliases aliases
                        COMPREPLY=($(compgen -W "${aliases}" -- "$cur"))
                        ;;
                esac
                return 0
                ;;
        esac
    fi
}
complete -F _perlbrew perlbrew

# vim:ft=sh:
