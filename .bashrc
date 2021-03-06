# Load exports and aliases
for file in $HOME/.{exports,aliases,functions,shell_extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Disable the per-terminal-session command history
export SHELL_SESSION_HISTORY=0

# Completions {{{
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.sfconsole/console_completion.sh ]; then
	source ~/.sfconsole/console_completion.sh
fi
# }}}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -x "$(command -v kitty)" ]; then
    source <(kitty + complete setup bash)
fi

# Show Git branch in prompt
export PROMPT_DIRTRIM=2
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\e[32m\]\w\[\e[31m\]$(__git_ps1)\[\e[39m\]\$ '

# Bash specific aliases
alias reload=". $HOME/.bashrc && echo 'Bash config reloaded from $HOME/.bashrc'"

detect-dark-mode

# Lastly the direnv hook
if type direnv &> /dev/null; then
	eval "$(direnv hook bash)"
fi
