if [ -f /opt/homebrew/bin/zsh ]; then
  ZSH_BIN=/opt/homebrew/bin/zsh
fi

if [ -f /usr/local/bin/zsh ]; then
  ZSH_BIN=/usr/local/bin/zsh
fi



if [[ $SHELL != $ZSH_BIN ]]; then
  echo "❯ Set `zsh` as your shell ($ZSH_BIN)"

  if [ ! `grep $ZSH_BIN /etc/shells` ]; then
    echo $ZSH_BIN | sudo tee -a /etc/shells
  fi

  chsh -s $ZSH_BIN
fi
