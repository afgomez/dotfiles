local servers = {
   cssls = {},
   efm = {}, -- setup below
   html = {},
   jsonls = {},
   lua_ls = {
      settings = {
         Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
         },
      },
   },
   rust_analyzer = {},
   tailwindcss = {},
   tsserver = {},
   volar = {},
   yamlls = {},
}

vim.api.nvim_create_autocmd({ "LspAttach" }, {
   desc = "LSP actions",
   callback = function(event)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buffer, desc = "LSP: Show information" })
      vim.keymap.set("n", "C-]", vim.lsp.buf.definition, { buffer = event.buffer, desc = "LSP: Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buffer, desc = "LSP: Go to references" })

      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buffer, desc = "LSP: Rename" })
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = event.buffer, desc = "LSP: Code action" })

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "View diagnostic message" })
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
   end,
})

return {
   {
      "neovim/nvim-lspconfig",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         { "creativenull/efmls-configs-nvim", version = "v1.x.x" },
         { "folke/neodev.nvim", config = true },
         { "williamboman/mason.nvim", config = true },
         {
            "williamboman/mason-lspconfig.nvim",
            config = function()
               require("mason-lspconfig").setup({
                  ensure_installed = vim.tbl_keys(servers),
               })
            end,
         },
      },

      config = function()
         vim.lsp.set_log_level("trace")

         local jsTools = {
            require("efmls-configs.formatters.prettier_d"),
            require("efmls-configs.linters.eslint_d"),
         }

         local languages = {
            javascript = jsTools,
            typescript = jsTools,
            typescriptreact = jsTools,
            vue = jsTools,
            lua = {
               require("efmls-configs.linters.luacheck"),
               require("efmls-configs.formatters.stylua"),
            },
         }

         -- efm configuration. We do it here to
         servers.efm = {
            filetypes = vim.tbl_keys(languages),
            init_options = {
               documentFormatting = true,
               documentFormattingRange = true,
            },
            settings = {
               rootMarkers = { ".git/" },
               languages = languages,
            },
         }

         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

         require("mason-lspconfig").setup_handlers({
            function(server_name)
               local server = require("lspconfig")[server_name]

               server.setup(vim.tbl_deep_extend("force", servers[server_name] or {}, {
                  capabilities = capabilities,
               }))
            end,
         })
      end,
   },
}
