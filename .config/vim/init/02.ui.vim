" Colorscheme
"
syntax on
set termguicolors     " enable true colors support
let ayucolor="dark"
colorscheme ayu


" General UI
"
set number
set cursorline

set scrolloff=5      " Show some context when scrolling pages

set laststatus=2
set cmdheight=2

set signcolumn=yes   " Prevent the UI from jumping when showing gutter symbols

set updatetime=300

set linespace=2      " In graphic windows, tweak the line-height

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Visual blocks
"
set virtualedit=block

" Wrap
"
set nowrap
set linebreak
set showbreak=↪

" FZF
"
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.4, 'yoffset': 0.05 } }


" 
