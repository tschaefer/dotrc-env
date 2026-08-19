#! bash oh-my-bash.module

if _omb_util_binary_exists hcloud; then
    source <(hcloud completion bash)
    alias hcloud="hcloud --no-experimental-warnings"
fi

OMB_PLUGIN_CLOUD_KUBECTL_CONFIG=${OMB_PLUGIN_CLOUD_KUBECTL_CONFIG:-"$OSH_HOME/.kubeconfig"}

if _omb_util_binary_exists kubectl; then
    export KUBECONFIG=$OMB_PLUGIN_CLOUD_KUBECTL_CONFIG
    source <(kubectl completion bash)
    if _omb_util_binary_exists kubecolor; then
        alias kubectl="kubecolor"

        kubecolor() {
            if [[ $1 != "diff" ]]; then
                command kubecolor "$@"
                return $?
            fi

            command kubecolor "$@" | batcat --plain --language=diff
        }
    fi
fi

if _omb_util_binary_exists helm; then
    source <(helm completion bash)
fi

if _omb_util_binary_exists finchctl; then
    source <(finchctl completion bash)
fi

if _omb_util_binary_exists tailscale; then
    source <(tailscale completion bash)
fi

if _omb_util_binary_exists arkade; then
    source <(arkade completion bash)
fi

if _omb_util_binary_exists argocd; then
    source <(argocd completion bash)
    alias argocd="argocd --grpc-web"
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
