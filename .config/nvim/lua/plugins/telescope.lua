return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.2",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   cmd = "Telescope",
   keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>",                    desc = "Find files" },
      { "<leader>b", "<cmd>Telescope buffers<cr>",                       desc = "Find buffers" },
      { "<leader>s", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = 'LSP: Find symbols' },
   },
   config = function()
      require(
         "telescope"
      ).setup({
         defaults = { mappings = { i = { ["<esc>"] = "close" } } },
      })
      require("telescope").load_extension("fzf")
   end,
}
