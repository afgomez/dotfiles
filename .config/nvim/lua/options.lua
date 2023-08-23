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


-- Splits
vim.o.splitright = true


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

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"


-- UI
vim.o.number = true
vim.o.signcolumn = 'yes'

vim.o.cursorline = true

vim.o.laststatus = 2
vim.o.cmdheight = 2

vim.o.scrolloff = 8

vim.o.virtualedit = 'block'
vim.o.termguicolors = true

-- Wrap/line break behaviour
vim.o.wrap = false
vim.o.linebreak = true
vim.o.showbreak = '↪'



-- Fold
vim.o.foldlevel = 999
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"


-- Misc
vim.o.history = 10000


-- Hush
vim.o.swapfile = false

-- Store backups. Not everything is under version control, and the eventual
-- 'git clean' might remove things I don't mean to remove
local backupdir = vim.fn.stdpath('cache') .. '/backup'
vim.o.backup = true
vim.o.backupdir = backupdir


-- Allow undoing after a file is closed.
local undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.undofile = true
vim.o.undodir = undodir

vim.o.undolevels = 1000


-- Ensure directories exist
vim.cmd([[
if !isdirectory(expand(&backupdir))
   call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&undodir))
   call mkdir(expand(&undodir), "p")
endif
]])
