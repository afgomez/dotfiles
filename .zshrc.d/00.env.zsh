system=`uname -s`

# Always use English
export LANG=en_US.UTF-8

# Use the one and only terminal editor
export EDITOR=vim

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

if [ $system=="Darwin" ]; then
  # Use colors in LS
  export CLICOLOR=1
fi

export FZF_DEFAULT_OPTS="--layout=reverse --info=hidden"

# Load brew in Apple Silicon machines
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
