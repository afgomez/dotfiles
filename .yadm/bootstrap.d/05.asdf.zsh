if command -v asdf >/dev/null 2>&1; then
  echo '❯ Install `asdf` plugins'
  asdf plugin-add nodejs
  asdf plugin-add ruby
  asdf plugin-add python
fi
