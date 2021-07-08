-- Leader
vim.g.mapleader = ","


-- Buffer switching
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true, silent = true })


-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})


-- Reselect when identing visual blocks 
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })


-- Telescope 
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('plugin/telescope').project_files()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
