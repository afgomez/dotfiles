return {
   -- Guess indent settings
   {
      "NMAC427/guess-indent.nvim",
   },

   -- Remember last edit position
   {
      "vladdoster/remember.nvim",
      opts = { open_folds = true },
   },

   -- Use readline (emacs, bash) cursor movements in insert mode
   {
      "tpope/vim-rsi",
   },

   -- `[` and `]` keys
   {
      "tummetott/unimpaired.nvim",
      opts = {},
   },

   -- SplitJoin
   -- TODO: explore https://github.com/CKolkey/ts-node-action/ instead
   {
      "Wansmer/treesj",
      keys = { "gs", "gj", "gt" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         local treesj = require("treesj")
         treesj.setup({ use_default_keymaps = false })

         vim.keymap.set("n", "gs", treesj.split, { desc = "Split node" })
         vim.keymap.set("n", "gS", function()
            treesj.split({ split = { recursive = true } })
         end, { desc = "Split nodes recursively" })

         vim.keymap.set("n", "gj", treesj.join, { desc = "Join node" })
         vim.keymap.set("n", "gJ", function()
            treesj.join({ join = { recursive = true } })
         end, { desc = "Join nodes recursively" })

         vim.keymap.set("n", "gt", treesj.toggle, { desc = "Toggle single/multi line node" })
         vim.keymap.set("n", "gT", function()
            treesj.toggle({ join = { recursive = true }, split = { recursive = true } })
         end, { desc = "Toggle single/multi line node recursively" })
      end,
   },

   -- {
   --    "ckolkey/ts-node-action",
   --    dependencies = { "nvim-treesitter" },
   --    config = function()
   --       require("ts-node-action").setup()
   --
   --       vim.keymap.set("n", "ga", require("ts-node-action").node_action, { desc = "Trigger node action" })
   --    end,
   -- },

   -- Surround
   {
      "kylechui/nvim-surround",
      version = "*",
      opts = { move_cursor = false },
   },

   -- Autopairs
   {
      "windwp/nvim-autopairs",
      dependencies = {
         "hrsh7th/nvim-cmp",
      },
      config = function()
         local cmp_autopairs = require("nvim-autopairs.completion.cmp")
         local cmp = require("cmp")

         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

         require("nvim-autopairs").setup()
      end,
   },
}
