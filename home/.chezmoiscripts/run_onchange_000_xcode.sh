#!/bin/sh

echo "❯ Try to install XCode command line tools..."
xcode-select --install || exit 0
