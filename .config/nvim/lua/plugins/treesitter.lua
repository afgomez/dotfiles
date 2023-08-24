return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "andymass/vim-matchup",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
   },
   tag = "v0.9.1",
   build = ":TSUpdate",
   config = function()
      require("nvim-treesitter.configs").setup({
         ensure_installed = "all",

         highlight = {
            enable = true,
         },

         indent = {
            enable = true,
         },

         context_commentstring = {
            enable = true,
            enable_autocmd = false,
         },

         matchup = {
            enable = true,
         },

         endwise = {
            enable = true,
         },

         autotag = {
            enable = true,
         },

         textobjects = {
            select = {
               enable = true,
               lookahead = true,
               keymaps = {
                  -- You can use the capture groups defined in textobjects.scm
                  ["aa"] = "@parameter.outer",
                  ["ia"] = "@parameter.inner",
                  ["am"] = "@function.outer",
                  ["im"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
               },
            },
         },
      })
   end,
}
