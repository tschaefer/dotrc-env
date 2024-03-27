#! bash oh-my-bash.module

__conda_setup="$(${OSH_HOME:-$HOME}/.local/share/miniconda/bin/conda shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${OSH_HOME:-$HOME}/.local/share/miniconda/etc/profile.d/conda.sh" ]; then
        . "${OSH_HOME:-$HOME}/.local/share/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="${OSH_HOME:-$HOME}/.local/share/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
