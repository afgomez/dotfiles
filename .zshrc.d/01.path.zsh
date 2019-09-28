# User scripts
path=($HOME/bin $path)

# Yarn global scripts
command -v yarn >/dev/null 2>&1 && path=(`yarn global bin` $path)

# Rust
if [ -d "$HOME/.cargo/bin" ]; then
  path=($HOME/.cargo/bin $path)
fi


