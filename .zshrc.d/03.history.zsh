HISTFILE=~/.zsh_history

HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY_TIME
setopt HIST_IGNORE_SPACE

# Ignore certain commands
HISTORY_IGNORE='(exit|clear|ls|fg|bg|)'

# By default the variable above only prevents the comands from being
# added to $HISTFILE. This hook also removes them from the current
# interactive session
zshaddhistory() {
  emulate -L zsh
  [[ $1 != ${~HISTORY_IGNORE} ]]
}
