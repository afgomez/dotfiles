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
                  ["aa"] = { query = "@parameter.outer", desc = "A parameter" },
                  ["ia"] = { query = "@parameter.inner", desc = "A parameter" },
                  ["am"] = { query = "@function.outer", desc = "A function or method" },
                  ["im"] = { query = "@function.inner", desc = "A function or method" },
                  ["ac"] = { query = "@class.outer", desc = "A class" },
                  ["ic"] = { query = "@class.inner", desc = "A class" },
               },
               selection_modes = {
                  ["@parameter.outer"] = "v",
                  ["@function.outer"] = "V",
                  ["@class.outer"] = "V",
               },
            },
            move = {
               enable = true,
               set_jumps = true,
               goto_next_start = {
                  ["]m"] = { query = "@function.outer", desc = "Beginning of next function or method" },
                  ["]c"] = { query = "@class.outer", desc = "Beginning of next class" },
               },
               goto_next_end = {
                  ["]M"] = { query = "@function.outer", desc = "End of next function or method" },
                  ["]C"] = { query = "@class.outer", desc = "End of next class" },
               },
               goto_previous_start = {
                  ["[m"] = { query = "@function.outer", desc = "Beginning of previous function or method" },
                  ["[c"] = { query = "@class.outer", desc = "Beginning of previous class" },
               },
               goto_previous_end = {
                  ["[M"] = { query = "@function.outer", desc = "End of previous function or method" },
                  ["[C"] = { query = "@class.outer", desc = "End of previous class" },
               },
            },
         },
      })

      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      -- TODO explore https://github.com/ghostbuster91/nvim-next
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
   end,
}
