# Load exports and aliases
for file in $HOME/.{exports,aliases,functions,shell_extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Zsh specific aliases
alias reload=". $HOME/.zshrc && echo 'ZSH config reloaded from $HOME/.zshrc'"

# Completions {{{
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}

	if [ -d $(brew --prefix)/share/zsh-completions ]; then
		FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}
	fi
fi

autoload -Uz compinit
compinit

setopt correctall # command correction

# Symfony2 console completion script
source ~/.sfconsole/console_completion.sh
# }}}

# zsh-autosuggestions
[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-fast-syntax-highlighting
[ -f $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fast Node Manager
if type fnm &> /dev/null; then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Detect dark mode
add-zsh-hook preexec detect-dark-mode

# Bindings {{{
bindkey '^R' history-incremental-pattern-search-backward
# }}}

# Initialise Starship
eval "$(starship init zsh)"

# Lastly the direnv hook
if type direnv &> /dev/null; then
	eval "$(direnv hook bash)"
fi
