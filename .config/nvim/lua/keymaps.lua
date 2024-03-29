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
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the window on the left" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the window below" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the window above" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the window on the right" })

-- Reselect when identing visual blocks
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- Netrw
vim.keymap.set("n", "<leader>e", ":25Lexplore<CR>", { noremap = true, desc = "Open Netrw on the side" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "View diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


-- Git
vim.keymap.set('n', "<leader>gg", ":tab G<cr>", { desc = 'Open Fugitive in new tab' })
vim.keymap.set({ 'n', 'v' }, "<leader>gb", ":GBrowse<cr>", { desc = 'Open file in Github' })
vim.keymap.set({ 'n', 'v' }, "<leader>gl", ":Git blame<cr>", { desc = 'View git blame for file/selection' })

-- UI
vim.keymap.set('n', "<leader>q", ":Sayonara!<cr>", { silent = true, desc = "Close buffer" })

if vim.g.neovide then
   -- Fix scrolling
   vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelUp>", "<C-Y>")
   vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelDown>", "<C-E>")
end

if vim.fn.has("gui") then
   -- MacOS movement key mappings:qa
   vim.keymap.set({ "n", "c", "i" }, "<D-Left>", "<Home>", { noremap = true })
   vim.keymap.set({ "n" }, "<M-Left>", "b", { noremap = true })
   vim.keymap.set({ "i" }, "<M-Left>", "<C-o>b", { noremap = true })
   vim.keymap.set({ "c" }, "<M-Left>", "<S-Left>", { noremap = true })

   vim.keymap.set({ "n", "c", "i" }, "<D-Right>", "<End>", { noremap = true })
   vim.keymap.set({ "n" }, "<M-Right>", "w", { noremap = true })
   vim.keymap.set({ "i" }, "<M-Right>", "<C-o>w", { noremap = true })
   vim.keymap.set({ "c" }, "<M-Right>", "<S-Right>", { noremap = true })

   vim.keymap.set({ "n", "i" }, "<D-Up>", "<C-Home>", { noremap = true })
   vim.keymap.set({ "n" }, "<M-Up>", "{", { noremap = true })
   vim.keymap.set({ "i" }, "<M-Up>", "<C-o>{", { noremap = true })

   vim.keymap.set({ "n", "i" }, "<D-Down>", "<C-End>", { noremap = true })
   vim.keymap.set({ "n" }, "<M-Down>", "}", { noremap = true })
   vim.keymap.set({ "i" }, "<M-Down>", "<C-o>}", { noremap = true })

   vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
   vim.keymap.set("i", "<D-BS>", "<C-u>", { noremap = true })

   -- Shift selection
   vim.keymap.set({ "n", "v", "i" }, "<S-D-Left>", "<S-Home>", { noremap = true })
   vim.keymap.set({ "n", "v", "i" }, "<S-M-Left>", "<S-C-Left>", { noremap = true })
   vim.keymap.set({ "n", "v", "i" }, "<S-D-Right>", "<S-End>", { noremap = true })
   vim.keymap.set({ "n", "v", "i" }, "<S-M-Right>", "<S-C-Right>", { noremap = true })
   vim.keymap.set({ "n", "v", "i" }, "<S-D-Up>", "<S-C-Home>", { noremap = true })
   vim.keymap.set({ "n", "v", "i" }, "<S-D-Down>", "<S-C-End>", { noremap = true })

   -- MacOS Copy/Paste
   vim.keymap.set("v", "<D-c>", '"*y')
   vim.keymap.set({ "n", "v" }, "<D-v>", '"*P')
   vim.keymap.set({ "c", "i" }, "<D-v>", "<C-R>*")

   -- MacOS Standard GUI
   vim.keymap.set({ "n", "i", "v" }, "<D-s>", ":w<CR>", { noremap = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-w>", ":Sayonara!<CR>", { noremap = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-t>", ":tabnew<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-M-Left>", ":tabprev<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-M-Right>", ":tabnext<CR>", { noremap = true, silent = true })

   vim.keymap.set("n", "<D-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

   -- Tab navigation
   vim.keymap.set({ "n", "i", "v" }, "<D-1>", ":tabn 1<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-2>", ":tabn 2<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-3>", ":tabn 3<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-4>", ":tabn 4<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-5>", ":tabn 5<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-6>", ":tabn 6<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-7>", ":tabn 7<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-8>", ":tabn 8<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-9>", ":tabn 9<CR>", { noremap = true, silent = true })
   vim.keymap.set({ "n", "i", "v" }, "<D-0>", ":tabn 10<CR>", { noremap = true, silent = true })

   -- Cmd-Enter in the middle of the line creates a new line
   vim.keymap.set("i", "<D-CR>", "<C-o>o")

   -- Find in file
   vim.keymap.set("n", "<D-f>", "/", { noremap = true })
   vim.keymap.set("n", "<S-D-f>", ":grep ", { noremap = true }) -- Not working :/
end
