setopt prompt_subst

autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '%b%c%u|%a'
zstyle ':vcs_info:*' formats '%b%c%u'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'


precmd () {
  psvar=()
  vcs_info

  if [[ -n $vcs_info_msg_0_ ]]; then
    color=""

    case "$vcs_info_msg_0_" in
      master*)
        color="red"
      ;;
      main*)
        color="red"
      ;;
      *)
        color="yellow"
      ;;
    esac

    print -v 'psvar[1]' -Pr -- $color
    print -v 'psvar[2]' -Pr -- "$vcs_info_msg_0_"
  fi
}

PS1='%~%(2V.[%F{%1v}%2v%f].)%# '
