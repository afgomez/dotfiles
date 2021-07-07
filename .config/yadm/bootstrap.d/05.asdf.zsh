if command -v asdf >/dev/null 2>&1; then
  echo '❯ Install `asdf` plugins'
  asdf plugin-add nodejs
  asdf plugin-add ruby
  asdf plugin-add python

  echo '❯ Add node team keyring'
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi
