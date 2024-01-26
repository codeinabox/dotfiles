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

# Load NVM completion
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# Bash specific aliases
alias reload=". $HOME/.bashrc && echo 'Bash config reloaded from $HOME/.bashrc'"

detect-dark-mode

# Calls the function before each command
trap load-nvmrc DEBUG

# Initialise Starship, must be called after trap
eval "$(starship init bash)"

# Lastly the direnv hook
if type direnv &> /dev/null; then
	eval "$(direnv hook bash)"
fi
