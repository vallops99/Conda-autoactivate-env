# Conda-autoactivate-env
Add autoactivate functionality on Conda by cding into a directory.


## Instructions

Add the sh's code inside your shell profile. You can find the shell profile by opening a terminal, cd ~ or cd $HOME, ls -a and search for a file called .bashrc/.zprofile/.zshrc (for sure there are other names for this file, search your profile file name on Google based on your OS).
  
This script will run every time you launch the cd command and it will search for a .conda_config file in the directory your cding into.

The .conda_config file has to contain the name of the env you want to activate, and only that.


## Script

As the script is really short i'll add it also there, so you can copy and paste.

Cheers!
