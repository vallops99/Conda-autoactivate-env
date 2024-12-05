function _z_do_conda_activate() {
    if [ -f "$PWD/.conda_config" ]; then
        export CONDACONFIGDIR=$PWD
        conda activate "$(cat .conda_config)"
    elif [ "$CONDACONFIGDIR" ]; then
        if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
            export CONDACONFIGDIR=""
            conda deactivate
        fi
    fi
}
if [[ -n "$CONDA_SHLVL" ]]; then
    export CONDACONFIGDIR=""
    cd() { builtin cd "$@" && _z_do_conda_activate
    }
    _z_do_conda_activate
fi
