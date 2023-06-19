# User scripts
path=($HOME/bin $path)

# Yarn global scripts
command -v yarn >/dev/null 2>&1 && path=(`yarn global bin` $path)

# Rust
if [ -d "$HOME/.cargo/bin" ]; then
  path=($HOME/.cargo/bin $path)
fi

# Go
if [ -d "$HOME/go/bin" ]; then
  path=($HOME/go/bin $path)
fi

# PostgreSQL tooling

if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
  path=(/opt/homebrew/opt/libpq/bin $path)
fi
