vim.api.nvim_create_user_command("Format", function(options)
   if options.range > 0 then
      vim.lsp.buf.format({
         range = {
            ["start"] = { options.line1, 0 },
            ["end"] = { options.line2, 0 },
         },
      })
   else
      vim.lsp.buf.format()
   end
end, { range = true, desc = "LSP: Format" })
