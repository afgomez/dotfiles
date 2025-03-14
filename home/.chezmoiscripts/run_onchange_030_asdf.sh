#!/bin/sh

PLUGINS="nodejs ruby"

for plugin in $PLUGINS; do
  echo "❯ Installing asdf($plugin)..."

  asdf plugin add "$plugin"
  asdf install "$plugin" latest
  asdf set -u "$plugin" latest
done
