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
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_available

# Config dirs for specific utilities
export JJ_CONFIG="$XDG_CONFIG_HOME/jj/config.toml"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
