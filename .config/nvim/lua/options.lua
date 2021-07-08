-- Default Indent settings
-- Might be overriden by Editorconfig or for specific languages
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.autoindent = true
vim.o.smartindent = true


-- Buffers
vim.o.hidden = true

vim.o.switchbuf = 'useopen'

vim.o.autoread = true
vim.o.autowriteall = true

vim.api.nvim_exec([[
augroup auto_read_write
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime
  autocmd BufLeave,FocusLost * silent! wall
augroup END
]], false)


-- Mouse
vim.o.mouse = "a"


-- Use system clipboard
vim.o.clipboard = 'unnamed,unnamedplus'


-- Select like other editors
vim.o.selection = 'exclusive'


-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true


-- UI
vim.o.number = true
vim.o.signcolumn = 'yes'

vim.o.cursorline = true

vim.o.laststatus = 2
vim.o.cmdheight = 2

vim.o.scrolloff = 5

vim.o.virtualedit = 'block'

vim.o.termguicolors = true

-- TODO for GUI, change this based on light/dark mode
vim.o.background = 'dark'
vim.api.nvim_command('colorscheme default')



-- GUI
vim.o.linespace = 2
vim.o.guifont = "PragmataPro:h14"


-- Wrap/line break behaviour
vim.o.wrap = false
vim.o.linebreak = true
vim.o.showbreak = '↪'


-- Misc
vim.o.history = 10000
