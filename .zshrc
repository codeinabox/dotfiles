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

# iTerm2 integration
if [ -f "${HOME}/.iterm2_shell_integration.zsh" ]; then
	source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Symfony2 console completion script
source ~/.sfconsole/console_completion.sh
# }}}

# Prompt {{{
if [ -f $(brew --prefix)/git/contrib/completion/git-prompt.sh ]; then
	. $(brew --prefix)/git/contrib/completion/git-prompt.sh
fi

setopt prompt_subst
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT=$'%F{green}%~%f %F{blue}$%f '
export RPROMPT=$'%F{red}$(__git_ps1 "%s")$f'
# }}}

# Bindings {{{
bindkey '^R' history-incremental-pattern-search-backward
# }}}

# Lastly the direnv hook
if type direnv &> /dev/null; then
	eval "$(direnv hook bash)"
fi
