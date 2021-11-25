# Conda-autoactivate-env
Add autoactivate functionality on Conda by cding into a directory.


## Instructions

Add the sh's code inside your shell profile. You can find the shell profile by opening a terminal, cd ~ or cd $HOME, ls -a and search for a file called .bashrc || .zprofile || .zshrc (for sure there are other names for this file, search your profile file name on Google based on your OS).
After you've find the file, just copy and paste the script and the end of it.

This script will run every time you launch the cd command and it will search for a .conda_config file in the directory your cding into.

The .conda_config file has to contain the name of the env you want to activate, and only that.

## Good to know

When you'll cd out of the directory the env will automatically deactivate.

## Script

As the script is really short I'll add it there also, so you can copy and paste.

<pre>
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
</pre>

Cheers!
