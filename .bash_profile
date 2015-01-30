# Load exports and aliases
for file in $HOME/.{exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Lastly the direnv hook
eval "$(direnv hook bash)"
