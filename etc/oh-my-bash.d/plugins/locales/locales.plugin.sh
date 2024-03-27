#! bash oh-my-bash.module

OMB_PLUGIN_LOCALES_LANGUAGE="en_US.UTF-8 de_DE.UTF-8 C.UTF-8 C"
OMB_PLUGIN_LOCALES_COUNTRY="de_DE.UTF-8 C.UTF-8 C"

function _omb_plugin_locale_available {
    local locale
    local locales

    locale=$1

    locales=$(locale --all-locales | tr '\n' ' ')
    echo "${locales}" | grep --quiet --ignore-case --word-regexp "$(echo ${locale} | tr -d '-')"
}

function _omb_plugin_locales_set_country {
    local country
    local locale

    local ifs_old="${IFS}"; IFS=" "
    read -r -a country <<< ${OMB_PLUGIN_LOCALES_COUNTRY}
    IFS="${ifs_old}"

    for locale in "${country[@]}"; do
        if _omb_plugin_locale_available $locale; then
            export LC_ADDRESS=${locale}
            export LC_COLLATE=${locale}
            export LC_CTYPE=${locale}
            export LC_IDENTIFICATION=${locale}
            export LC_MEASUREMENT=${locale}
            export LC_MONETARY=${locale}
            export LC_NAME=${locale}
            export LC_NUMERIC=${locale}
            export LC_PAPER=${locale}
            export LC_TELEPHONE=${locale}
            export LC_TIME=${locale}
            break
        fi
    done
}

function _omb_plugin_locales_set_language {
    local language
    local locale

    local ifs_old="${IFS}"; IFS=" "
    read -r -a language <<< ${OMB_PLUGIN_LOCALES_LANGUAGE}
    IFS="${ifs_old}"

    for locale in "${language[@]}"; do
        if _omb_plugin_locale_available $locale; then
            export LC_MESSAGES=${locale}
            break
        fi
    done
}

_omb_plugin_locales_set_country
_omb_plugin_locales_set_language
