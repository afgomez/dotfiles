#!/bin/sh

if ! command -v brew >/dev/null 2>&1; then
  echo "❯ I could not find \`brew\` on the path."
  echo "❯ Installing..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "❯ Setting up homebrew..."
  export PATH="/opt/homebrew/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "❯ Installing homebrew formulae..."
brew bundle --file=- <<EOF

# Commands
brew "asdf"
brew "bat"
brew "difftastic"
brew "docker"
brew "docker-compose"
brew "fd"
brew "fzf"
brew "git"
brew "jj"
brew "jq"
brew "less"
brew "mergiraf"
brew "neovim"
brew "node"
brew "ripgrep"
brew "rm-improved"
brew "ruby"
brew "rustup"
brew "tealdeer"
brew "temporal"
brew "tokei"
brew "tree"
brew "zoxide"
brew "zsh-completions"

# Dependencies
brew "autoconf"
brew "gmp"
brew "libyaml"
brew "readline"

# Applications
cask "appcleaner"
cask "ghostty"
cask "hammerspoon"
cask "imageoptim"
cask "maccy"
cask "orbstack"
cask "visual-studio-code"
cask "zed"

# Fonts
cask "font-iosevka"
cask "font-jetbrains-mono"

EOF
