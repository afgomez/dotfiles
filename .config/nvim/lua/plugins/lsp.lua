local servers = {
   cssls = {},
   html = {},
   jsonls = {},
   lua_ls = {
      Lua = {
         workspace = { checkThirdParty = false },
         telemetry = { enable = false },
      },
   },
   rust_analyzer = {},
   tsserver = {},
   volar = {},
   yamlls = {},
}

vim.api.nvim_create_autocmd({ 'LspAttach' }, {
   desc = 'LSP actions',
   callback = function(event)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buffer })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buffer })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = event.bufffer })
   end
})



return {
   'neovim/nvim-lspconfig',
   dependencies = {
      { 'folke/neodev.nvim', config = true },
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim',
         config = function()
            require('mason-lspconfig').setup({
               ensure_installed = vim.tbl_keys(servers),
            })
         end,
      },
   },

   config = function()
      require('mason-lspconfig').setup_handlers {
         function(server_name)
            require('lspconfig')[server_name].setup {
               -- capabilities = capabilities,
               -- on_attach = on_attach,
               settings = servers[server_name],
               filetypes = (servers[server_name] or {}).filetypes,
            }
         end
      }
   end
}
