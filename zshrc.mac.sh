#!/bin/zsh
SCRIPT_PATH=$(dirname $0)

# set the input in the terminal to use vi keybindings
#set -o vi
bindkey -v
# sets the escape key to be also jj
bindkey -M viins 'jj' vi-cmd-mode
# adds the ability to search with ctrl+r
bindkey '^R' history-incremental-search-backward
#read all the aliases from my alieases file
source $SCRIPT_PATH/alias.mac.sh

# these 3 lines will make the clicking on v in normal mode to open the command line in vim to be edited
# :wq will run the command
export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

