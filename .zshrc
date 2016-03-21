# Load exports and aliases
for file in $HOME/.{exports,aliases,functions,shell_extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Zsh specific aliases
alias reload=". $HOME/.zshrc && echo 'ZSH config reloaded from $HOME/.zshrc'"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Symfony2 console completion script
source ~/.sfconsole/console_completion.sh

# Customize to your needs...
compdef vman="man"   # autocomplete for vman

# Lastly the direnv hook
eval "$(direnv hook zsh)"
