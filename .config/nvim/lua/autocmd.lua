vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
   pattern = { "*" },
   command = "silent! checktime",
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
   pattern = { "*" },
   callback = function()
      vim.lsp.buf.format()
   end
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
   pattern = { "*" },
   command = "silent! wall",
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
   pattern = { "*" },
   callback = function()
      if (vim.opt.textwidth:get() == 0) then
         vim.opt_local.colorcolumn = '80'
      else
         vim.opt_local.colorcolumn = '+0'
      end
   end
})
