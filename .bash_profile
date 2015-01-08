# Load exports and aliases 
for file in $HOME/.{exports,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file
