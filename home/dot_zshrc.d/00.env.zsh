system=$(uname -s)

export LANG="en_US.UTF-8"

export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

if [ $system=="Darwin" ]; then
  export CLICOLOR=1
fi

PAGER="less -FRXi"

# Config dirs for specific utilities
export JJ_CONFIG="$XDG_CONFIG_HOME/jj/config.toml"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# Homebrew in Apple Silicon
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# vfox
if type vfox &>/dev/null; then
  eval "$(vfox activate zsh)"
fi
