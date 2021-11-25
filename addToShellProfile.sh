export CONDACONFIGDIR=""
cd() { builtin cd "$@" && 
if [ -f $PWD/.conda_config ]; then
    export CONDACONFIGDIR=$PWD
    conda activate $(cat .conda_config)
elif [ -n $CONDACONFIGDIR ]; then
    if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
	export CONDACONFIGDIR=""
	conda deactivate
    fi
fi }