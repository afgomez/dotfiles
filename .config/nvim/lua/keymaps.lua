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


-- Compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end


-- Use tab to insert selection
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['compe#confirm'](t('<CR>'))
  else
    return t "<Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', [[compe#close('<C-e>')]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', [[compe#scroll({ 'delta': -4 })]], { noremap = true, silent = true, expr = true })
