let mapleader=","

" Cmd-P replacement
"
function CmdP()

  if FugitiveGitDir() == ''
    exe 'Files'
  else
    exe 'GFiles'
  endif

endfunction

map <Leader>gf :call CmdP()<CR>
map <Leader>gb :Buffers<CR>
