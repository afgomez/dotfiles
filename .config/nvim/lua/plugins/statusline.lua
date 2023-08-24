return {
   "nvim-lualine/lualine.nvim",
   event = "ColorScheme",
   dependencies = {
      -- "nvim-tree/nvim-web-devicons",
   },
   opts = {
      theme = "rose-pine",
      sections = {
         lualine_x = { "filetype" },
      },
   },
}
