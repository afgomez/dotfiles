# Autocomplete code projects
CODE_PATH="$HOME/code"

mkdir -p $CODE_PATH
cdpath=(. $CODE_PATH)

# Treat directories as commands (makes `% ..` work)
setopt autocd

if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi
