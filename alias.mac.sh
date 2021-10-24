#!/bin/bash

# use this to debug the path of the current script
#SCRIPT_PATH=$(dirname $0)
#echo $SCRIPT_PATH

source $SCRIPT_PATH/alias.base.sh
# copy the current branc to the clipboard
alias ccb='git rev-parse --abbrev-ref HEAD | clipcopy'
