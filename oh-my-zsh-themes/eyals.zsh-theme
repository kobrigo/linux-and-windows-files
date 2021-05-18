PROMPT=$'%{$fg[white]%}$(ruby_prompt_info)%{$reset_color%}%n %{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)%{$fg[cyan]%}%D{[%I:%M:%S]}\
%{$fg_bold[green]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[yellow]%}*%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
