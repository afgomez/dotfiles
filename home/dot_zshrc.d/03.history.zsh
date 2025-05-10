HISTFILE="$XDG_DATA_HOME/zsh/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

HISTSIZE="100000"
SAVEHIST="100000"

HISTORY_IGNORE='(exit|clear|ls|fg|bg)'

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

zshaddhistory() {
    emulate -L zsh
    [[ $1 != ${~HISTORY_IGNORE} ]]
}
