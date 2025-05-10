#!/bin/sh

# Define the runtimes to install
RUNTIMES="nodejs ruby"

for runtime in $RUNTIMES; do
    echo "❯ Installing vfox($runtime)..."

    vfox add "$runtime"

    # Install the latest version of each runtime
    vfox install "$runtime@latest"
done

# vfox exits with `1` if a runtime is already installed and stops chezmoi from continuing
exit 0
