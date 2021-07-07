function() {
  local gitconfig_local=$HOME/.gitconfig.local

  if [[ ! -f $gitconfig_local ]]; then
    echo '❯ Configure git user'

    local name email
    vared -p 'Git name: ' -c name
    vared -p 'Git email: ' -c email

    git config -f $gitconfig_local user.name $name
    git config -f $gitconfig_local user.email $email
  else
    echo '❯ `$gitconfig_local` exists. Skipping git user configuration'
  fi
}
