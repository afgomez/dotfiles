return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.2",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   cmd = "Telescope",
   keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
   },
   config = function()
      require("telescope").setup({
         defaults = {
            mappings = {
               i = {
                  ["<esc>"] = "close",
               },
            },
         },
      })
      require("telescope").load_extension("fzf")
   end,
}
