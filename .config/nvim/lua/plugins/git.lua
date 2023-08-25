return {
   -- It has problems when jumping to a folder outside
   -- {
   --    "braxtons12/blame_line.nvim",
   --    opts = {
   --       show_in_visual = false,
   --       show_in_insert = false,
   --       prefix = "       ",
   --       template = "<author>, <author-time> • <summary>",
   --       -- delay = 300,
   --    },
   -- },
   {
      "ruifm/gitlinker.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         local gitlinker = require("gitlinker")
         gitlinker.setup({ mappings = nil })

         vim.api.nvim_create_user_command("GBrowse", function(options)
            if options.range > 0 then
               gitlinker.get_buf_range_url("v", { action_callback = gitlinker.actions.open_in_browser })
            else
               gitlinker.get_buf_range_url("n", { action_callback = gitlinker.actions.open_in_browser })
            end
         end, { range = true })
      end,
   },
}
