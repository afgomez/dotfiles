-- Space is leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer switching
vim.keymap.set("n", "<leader><leader>", "<c-^>", { noremap = true, silent = true, desc = "Jump to previous buffer" })

-- Match `gd` to `CTRL-]`.
vim.keymap.set("n", "gd", "<C-]>", { desc = "Go to definition" })

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the window on the left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the window on the right" })

-- Reselect when identing visual blocks
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
