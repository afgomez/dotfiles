return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "andymass/vim-matchup",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
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
      })
   end,
}
