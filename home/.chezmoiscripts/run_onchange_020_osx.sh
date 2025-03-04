#!/bin/sh

set -e

system="`uname -s`"

if [ $system != "Darwin" ]; then
  echo "System is not OSX. Skipping."
  exit
fi

echo "❯ Configure OSX"

# Screensaver
#
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Keyboard/Trackpad/Input
#
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.keyboard.fnState -int 1
defaults write -g com.apple.mouse.tapBehaviour -int 1

defaults write -g ApplePressAndHoldEnabled -bool false

defaults write -g NSAutomaticCapitaliationEnabled -bool true
defaults write -g NSAutomaticDashSubstitutionEnabled -bool true
defaults write -g NSAutomaticInlinePredictionEnabled -bool true
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool true
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool true
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
defaults write -g NSAutomaticTextCorrectionEnabled -bool true


# UI
# 
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true 
defaults write -g PMPrintingExpandedStateForPrint -bool true 
defaults write -g PMPrintingExpandedStateForPrint2 -bool true 


# Dock
#
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock largesize -int 64

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false



# Finder
#
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

defaults write com.apple.desktopServices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopServices DSDontWriteUsbStores -bool true

# Others
#
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false


# Reset
#
killall Finder
killall SystemUIServer
killall Dock
