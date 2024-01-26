# Load exports and aliases
for file in $HOME/.{exports,aliases,functions,shell_extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Zsh specific aliases
alias reload=". $HOME/.zshrc && echo 'ZSH config reloaded from $HOME/.zshrc'"

# Completions {{{
autoload -U compinit
compinit

setopt correctall # command correction

if [ -d /usr/local/share/zsh-completions ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Symfony2 console completion script
source ~/.sfconsole/console_completion.sh
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc

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
