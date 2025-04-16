function _z_do_conda_activate() {
    if [ "$CONDACONFIGDIR" ]; then
        if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
            export CONDACONFIGDIR=""
            micromamba deactivate
        fi
    fi
    if [ -f "$PWD/.conda_config" ]; then
        export CONDACONFIGDIR=$PWD
        micromamba activate "$(cat .conda_config)"
    fi
}
if [[ -n "$CONDA_SHLVL" ]]; then
    export CONDACONFIGDIR=""
    cd() { builtin cd "$@" && _z_do_conda_activate
    }
    _z_do_conda_activate
fi
