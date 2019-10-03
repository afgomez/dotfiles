system=`uname -s`

# Always use English
export LANG=en_US.UTF-8

# Use the one and only terminal editor
export EDITOR=vim

if [ $system=="Darwin" ]; then
  # Use colors in LS
  export CLICOLOR=1
fi
