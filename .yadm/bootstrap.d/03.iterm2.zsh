system=`uname -s`
if [ $system=Darwin ]; then
  echo "❯ Setting iTerm preference folder"
  defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.config/iterm"
fi
