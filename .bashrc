# Load exports and aliases
for file in $HOME/.{exports,aliases,functions,shell_extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Completions {{{
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/git/contrib/completion/git-completion.bash ]; then
	. $(brew --prefix)/git/contrib/completion/git-completion.bash
	# Completion for the `g` alias
	__git_complete g __git_main
fi

if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
	source `brew --prefix`/etc/bash_completion.d/vagrant
fi

if [ -f ~/.sfconsole/console_completion.sh ]; then
	source ~/.sfconsole/console_completion.sh
fi
# }}}

# Show Git branch in prompt
export PROMPT_DIRTRIM=2
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\e[32m\]\w\[\e[31m\]$(__git_ps1)\[\e[39m\]\$ '

# Bash specific aliases
alias reload=". $HOME/.bashrc && echo 'Bash config reloaded from $HOME/.bashrc'"

# Lastly the direnv hook
eval "$(direnv hook bash)"
