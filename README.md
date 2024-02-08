# Conda-autoactivate-env
Add autoactivate functionality on Conda by cding into a directory. (Only Unix-based OS)


## Instructions

Add the sh's code inside your shell profile. You can find the shell profile by opening a terminal, cd ~ or cd $HOME, ls -a and search for a file called .bashrc || .zprofile || .zshrc (for sure there are other names for this file, search your profile file name on Google based on your OS).
After you've find the file, just copy and paste the script and the end of it.

This script will run every time you launch the cd command and it will search for a .conda_config file in the directory your cding into.

The .conda_config file has to contain the name of the env you want to activate, and only that.

## Good to know

When you'll cd out of the directory the env will automatically deactivate.

This will only have an effect if conda is active (user has previously run `conda init`). Thus it may be added to the system-wide functions in /etc/bashrc || /etc/zshrc and it will add functionality for all users, but only users who've initialized conda.

## Script

As the script is really short I'll add it there also, so you can copy and paste.

```bash
if [[ -n "$CONDA_SHLVL" ]]; then
    export CONDACONFIGDIR=""
    cd() { builtin cd "$@" && 
    if [ -f $PWD/.conda_config ]; then
        export CONDACONFIGDIR=$PWD
        conda activate $(cat .conda_config)
    elif [ "$CONDACONFIGDIR" ]; then
        if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
            export CONDACONFIGDIR=""
            conda deactivate
        fi
    fi }
fi
```

Every suggestion/update will be accepted!

Cheers!
