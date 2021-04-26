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
