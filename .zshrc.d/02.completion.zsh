# Load completions from homebrew if available
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

setopt menu_complete

autoload -U compinit
compinit

# Use a navigable menu for completions
zstyle ':completion:*' menu select
