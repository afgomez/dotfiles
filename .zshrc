
if [ -d "$HOME/.zsh" ]; then
  for file in $HOME/.zsh/*.zsh; do
    source "$file"
  done
fi
