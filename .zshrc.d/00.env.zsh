system=`uname -s`

# Always use English
export LANG=en_US.UTF-8

# Use the one and only terminal editor
export EDITOR=vim

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

if [ $system=="Darwin" ]; then
  # Use colors in LS
  export CLICOLOR=1
fi
