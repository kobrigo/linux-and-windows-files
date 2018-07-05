alias g=git
alias ga='git add'
alias gb='git branch'
alias gcom='git checkout origin/master'
alias gph='git push origin HEAD --tags -u'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcl='git config --list'
alias gcm='git checkout master'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git difftool'
alias gf='git ls-files | grep'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gl='git log --oneline'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gm='git merge'
alias gp='git push'
alias gpoat='git push origin --all && git push origin --tags'
alias gr='git remote'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias grup='git remote update'
alias grv='git remote -v'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gup='git pull --rebase'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias cdh='cd /cygdrive/c/Users/eyal.kobrigo'
alias cdw='cd /cygdrive/c/Projects/DndEditor'
alias cds='cd /cygdrive/c/SupportToolsPortalWorkspace/SupportToolsPortal/SupportToolPortalUI'

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

aliad ll='ls -la'
