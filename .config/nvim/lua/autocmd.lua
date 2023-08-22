vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
    pattern = { "*" },
    command = "silent! checktime",
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost'}, {
   pattern = { "*" },
   command = "silent! wall",
})

