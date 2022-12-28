function() {
  # ASDF version manager
  local asdf_sh=$(brew --prefix asdf)/libexec/asdf.sh

  if [[ -e $asdf_sh ]]; then
    . $asdf_sh
  fi
}
