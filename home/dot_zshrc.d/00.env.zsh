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

# Homebrew in Apple Silicon
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PAGER="less -FRXi"

# ASDF Data dir
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

# Config dirs for specific utilities
export JJ_CONFIG="$XDG_CONFIG_HOME/jj/config.toml"
