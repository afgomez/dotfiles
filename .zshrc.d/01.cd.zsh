# Autocomplete code projects
cdpath=(. $HOME/code)

# Treat directories as commands
setopt autocd

# Load `z` from homebrew if available
if [ -f /opt/homebrew/bin/zoxide ]; then
  eval "$(/opt/homebrew/bin/zoxide init zsh)"
fi
