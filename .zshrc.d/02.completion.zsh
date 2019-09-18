setopt menu_complete

autoload -U compinit
compinit

# Use a navigable menu for completions
zstyle ':completion:*' menu select
