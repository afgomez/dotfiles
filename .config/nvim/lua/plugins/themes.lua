return {
   {
      "projekt0n/github-nvim-theme",
   },
   {
      "catppuccin/nvim",
      name = "catppuccin",
   },
   {
      "rose-pine/neovim",
      name = "rose-pine",
      lazy = false,
      priority = 1000,
      config = function()
         require("rose-pine").setup({
            dark_variant = "moon",
         })

         vim.cmd("colorscheme rose-pine")
      end,
   },
}
