alias lb='git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)" | vim -R -' 

# this uses clipcopy that has special cases for all OSes 
copyCurrentBranchToClipBoard()
{
    git branch | grep "*" | awk '{ print $2 }' | tr -d '\r' | clipcopy
}

alias cb='copyCurrentBranchToClipBoard'

# use vimdiff as the difftool for a file with git usage $> gd <filename> it will compare to the last version of the file.
alias gvd='git difftool -t vimdiff -y'

# use vimdiff as the mergetool in command prompt
alias gvm='git mergetool -t vimdiff -y'

# copy the current directory to the clipboard
alias ccd='pwd | clipcopy'

alias ll='ls -la'

# use by <some command> | tovim
alias tovim='vim -R -' 

alias gph='git push origin HEAD -u'
alias gpt='git push origin --tags'

