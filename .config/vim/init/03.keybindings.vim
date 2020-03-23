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



" coc.nvim
"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u"
endif

" Rename
nmap <leader>r <Plug>(coc-rename)
