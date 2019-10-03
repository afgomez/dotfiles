# Load completions from homebrew if available
if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

setopt menu_complete

autoload -U compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"

zstyle ':completion:*' use-cache 1
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Use a navigable menu for completions
zstyle ':completion:*' menu select

# Allow for typos and case insensitive completions
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3)) numeric)'
