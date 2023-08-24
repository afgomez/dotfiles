return {
   "nvim-lualine/lualine.nvim",
   event = "ColorScheme",
   dependencies = {
      -- "nvim-tree/nvim-web-devicons",
   },
   opts = {
      theme = "rose-pine",
      sections = {
         lualine_b = { "branch" },
         lualine_c = { "diagnostics", { "filename", path = 1 } },
         lualine_x = { "filetype" },
      },
      tabline = {
         lualine_a = { { "tabs", mode = 2 } },
      },
   },
}
