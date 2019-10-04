function() {
  # ASDF version manager
  local asdf_sh=$(brew --prefix asdf)/asdf.sh

  if [[ -e $asdf_sh ]]; then
    . $asdf_sh
  fi
}
