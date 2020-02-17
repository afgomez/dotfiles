" Don't use swap files
set noswapfile

" Have backups. Not everything is under version control, and sometimes I run
" the eventual 'git checkout'
set backup
set backupdir=$XDG_CACHE_HOME/vim/backup

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
