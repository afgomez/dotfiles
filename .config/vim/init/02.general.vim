" Indent settings
" Will be overriden by editorconfig
"
set tabstop=2
set shiftwidth=2 softtabstop=2 expandtab

set autoindent
set smartindent

" Clipboard
"
set clipboard=unnamed

" Don't be annoying
set visualbell

" File read/write related behaviour
"
set autoread
set hidden
set switchbuf=useopen

set autowrite
augroup focus_lost
  autocmd!
  autocmd BufLeave,FocusLost * silent! wall
augroup END

" Trigger autosave in iTerm, even in SSH
if (!has('gui'))
  let g:vitality_always_assume_iterm=1
endif


" Misc
"
"
set history=10000
