#! bash oh-my-bash.module

OMB_PLUGIN_LOCALES_LANGUAGE=${OMB_PLUGIN_LOCALES_LANGUAGE:-"en_US.UTF-8 de_DE.UTF-8 C.UTF-8 C"}
OMB_PLUGIN_LOCALES_COUNTRY=${OMB_PLUGIN_LOCALES_COUNTRY:-"de_DE.UTF-8 C.UTF-8 C"}
OMB_PLUGIN_LOCALES_TIMEZONE=${OMB_PLUGIN_LOCALES_TIMEZONE:-"Europe/Berlin"}

function timezones {
    if _omb_util_command_exists "timedatectl"; then
        timedatectl list-timezones --no-pager
    else
        awk '!/#/ { print $3 }' /usr/share/zoneinfo/zone.tab
    fi
}

function _omb_plugin_locales_set_timezone {
    if timezones | grep --quiet --word-regexp "${OMB_PLUGIN_LOCALES_TIMEZONE}"; then
        export TZ=${OMB_PLUGIN_LOCALES_TIMEZONE}
    else
        export TZ="UTC"
    fi
}

function _omb_plugin_locales_is_available {
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
        if _omb_plugin_locales_is_available $locale; then
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
        if _omb_plugin_locales_is_available $locale; then
            export LC_MESSAGES=${locale}
            break
        fi
    done
}

_omb_plugin_locales_set_timezone
_omb_plugin_locales_set_country
_omb_plugin_locales_set_language
