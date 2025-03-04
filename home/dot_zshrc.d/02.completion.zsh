if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# Load completions
autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"

zstyle ':completion:*' use-cache 1
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Command specific
if type chezmoi &>/dev/null; then
  source <(chezmoi completion zsh)
fi

if type jj &>/dev/null; then
  source <(jj util completion zsh)
fi
