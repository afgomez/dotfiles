#!/bin/sh
PLUGINS="nodejs ruby"

for plugin in $PLUGINS; do
  echo "❯ Installing asdf($plugin)..."

  asdf plugin add "$plugin"
  asdf set -u "$plugin" system
done
