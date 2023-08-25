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
            treesj.split({ recursive = true })
         end, { desc = "Split all nodes" })
         vim.keymap.set("n", "gj", treesj.join, { desc = "Join node" })
         vim.keymap.set("n", "gJ", function()
            treesj.join({ recursive = true })
         end, { desc = "Join all nodes" })
         vim.keymap.set("n", "gt", treesj.toggle, { desc = "Toggle single/multi line node" })
         vim.keymap.set("n", "gt", treesj.toggle, { desc = "Toggle single/multi line node" })
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

   -- Comment
   {
      "numToStr/Comment.nvim",
      config = function()
         require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
         })
      end,
      dependencies = {
         "JoosepAlviste/nvim-ts-context-commentstring",
      },
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
