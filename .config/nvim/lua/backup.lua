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

vim.o.undolevels=1000


-- Ensure directories exist
vim.api.nvim_exec([[
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
]], false)



