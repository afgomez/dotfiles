# Autocomplete code projects
cdpath=(. $HOME/code)

# Treat directories as commands
setopt autocd

# Load `z` from homebrew if available
if [[ -e "/usr/local/etc/profile.d/z.sh" ]]; then
  . /usr/local/etc/profile.d/z.sh
  [[ ! -e "$HOME/.z" ]] && touch $HOME/.z
fi

