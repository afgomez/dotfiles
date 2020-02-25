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

" Search
"
set hlsearch      " Highlight search results
set incsearch     " ...dynamically as they are typed.
set ignorecase    " Don't care about case
set smartcase     " Insensitive case unless there are some uppercase letters


" File read/write related behaviour
"
set hidden
set switchbuf=useopen

" Load files if they are newer
set autoread
au FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime

" Save files when focus is lost
set autowrite

augroup format
  autocmd!
  autocmd BufWritePre * silent! undojoin | silent! Neoformat
augroup END

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
set visualbell

set history=10000

set mouse=a
