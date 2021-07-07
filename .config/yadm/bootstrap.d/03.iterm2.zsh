system=`uname -s`
if [ $system=Darwin ]; then
  echo "❯ Setting iTerm preference folder"
  defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.config/iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi
