if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME=glob('~/.config')
endif

if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME=glob('~/.cache')
endif

if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME=glob('~/.local/share')
endif


if !empty(glob($XDG_CONFIG_HOME . "/vim/init.vim"))
  source $XDG_CONFIG_HOME/vim/init.vim
endif
