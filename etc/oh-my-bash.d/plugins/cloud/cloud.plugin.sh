#! bash oh-my-bash.module

if _omb_util_binary_exists aws && _omb_util_binary_exists aws_completer; then
    complete -C aws_completer aws
fi

if _omb_util_binary_exists hcloud; then
    source <(hcloud completion bash)
    alias hcloud="hcloud --no-experimental-warnings"
fi

OMB_PLUGIN_CLOUD_KUBECTL_CONFIG=${OMB_PLUGIN_CLOUD_KUBECTL_CONFIG:-"$OSH_HOME/.kubeconfig"}

if _omb_util_binary_exists kubectl; then
    export KUBECONFIG=$OMB_PLUGIN_CLOUD_KUBECTL_CONFIG
    source <(kubectl completion bash)
fi

if _omb_util_binary_exists helm; then
    source <(helm completion bash)
fi

if _omb_util_binary_exists arkade; then
    source <(arkade completion bash)

    function _omb_plugin_arkade_get {
        app=$1

        arkade get $app
        if [ $? -ne 0 ]; then
            return 1
        fi

        sudo mv ${OSH_HOME}/.arkade/bin/$app /usr/local/bin/$app
        sudo chmod 755 /usr/local/bin/$app
        sudo chown root:staff /usr/local/bin/$app
    }
    alias arkade-get=_omb_plugin_arkade_get
    alias arkade-list="arkade get | $PAGER"
fi

if _omb_util_binary_exists k3sup; then
    source <(k3sup completion bash)
fi

if _omb_util_binary_exists k3d; then
    source <(k3d completion bash)
fi

if _omb_util_binary_exists finch; then
    source <(finch completion bash)
fi

if _omb_util_binary_exists finchctl; then
    source <(finchctl completion bash)
fi

OMB_PLUGIN_CLOUD_FAAS_CLI_GATEWAY=${OMB_PLUGIN_CLOUD_FAAS_CLI_GATEWAY:-"https://f.i.coresec.zone"}

if _omb_util_binary_exists "faas-cli"; then
    export OPENFAAS_URL=$OMB_PLUGIN_CLOUD_FAAS_CLI_GATEWAY
    source <(faas-cli completion --shell bash)
fi

OMB_PLUGIN_CLOUD_MC_DISABLE_PAGER=${OMB_PLUGIN_CLOUD_MC_DISABLE_PAGER:-"true"}

if _omb_util_binary_exists mc; then
    export MC_DISABLE_PAGER=$OMB_PLUGIN_CLOUD_MC_DISABLE_PAGER
    complete -C mc mc
fi
