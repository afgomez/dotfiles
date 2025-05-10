#!/bin/sh

echo "❯ Installing LSPs and formatters..."

# ESLint, etc
npm i -g \
  bash-language-server typescript-language-server typescript vscode-langservers-extracted yaml-language-server @fsouza/prettierd @vue/language-server @vue/typescript-plugin

brew bundle --file=- <<EOF
# Lua
brew "stylua"
brew "lua-language-server"

# Bash
brew "shellcheck"
brew "shfmt"
EOF
