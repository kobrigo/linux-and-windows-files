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

# replace these 3 lines (till the ---- ) with the ones after
#autoload -Uz edit-command-line 
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
# ------
# these lines till the ^^^^ replaced the 3 lines above to solve a coloring of the command line (was showing as black)
# after returning from vim as the editor of the line
autoload -Uz edit-command-line
zle -N _original_edit_command_line edit-command-line

_edit_command_line_and_repaint_line() {
  zle _original_edit_command_line

  # Return to start of current terminal line and clear only this line
  printf '\r\033[2K'

  # Ask ZLE to fully redraw the prompt + buffer
  zle reset-prompt
  zle -R
}

zle -N _edit_command_line_and_repaint_line
bindkey -M vicmd v _edit_command_line_and_repaint_line
# ^^^^
