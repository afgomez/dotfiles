if [[ $SHELL != "/usr/local/bin/zsh" ]]; then
  echo '❯ Set `zsh` as your shell'

  if [ ! `grep /usr/local/bin/zsh /etc/shells` ]; then
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  fi

  chsh -s /usr/local/bin/zsh
fi

