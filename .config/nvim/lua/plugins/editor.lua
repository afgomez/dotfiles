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

   -- SplitJoin
   {
      "Wansmer/treesj",
      keys = { "<space>m", "<space>j", "<space>s" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("treesj").setup({})
      end,
   },

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
