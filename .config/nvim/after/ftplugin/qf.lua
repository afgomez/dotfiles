vim.opt_local.scrolloff = 0
vim.opt_local.number = false
vim.opt_local.cursorline = true
vim.opt_local.textwidth = 0

vim.keymap.set('n', '<Esc>', ':cclose<bar>lclose<CR>', { buffer = true, silent = true })
vim.keymap.set('n', '<CR>', '<CR> :cclose<bar>lclose<CR>', { buffer = true, silent = true, noremap = true })
