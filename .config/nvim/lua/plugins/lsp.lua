local function vue_root_path(startPath)
   local util = require("lspconfig.util")
   local root_path = util.find_package_json_ancestor(startPath)
   local package_json_path = util.path.join(root_path, "package.json")

   if util.path.exists(package_json_path) then
      local fd = io.open(package_json_path)
      if not fd then
         return nil
      end

      local data = fd:read("*a")
      fd:close()

      if not data then
         return nil
      end

      local _, package_json = pcall(vim.json.decode, data)
      if package_json and package_json.dependencies and package_json.dependencies.vue then
         return root_path
      end
   end

   return nil
end

vim.api.nvim_create_autocmd({ "LspAttach" }, {
   desc = "LSP actions",
   callback = function(event)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buffer, desc = "LSP: Show information" })
      -- vim.keymap.set("n", "C-]", vim.lsp.buf.definition, { buffer = event.buffer, desc = "LSP: Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buffer, desc = "LSP: Go to references" })

      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = event.buffer, desc = "LSP: Rename" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buffer, desc = "LSP: Rename" })

      vim.keymap.set(
         { "n", "v" },
         "<leader>la",
         "<cmd>CodeActionMenu<CR>",
         -- vim.lsp.buf.code_action,
         { buffer = event.buffer, desc = "LSP: Code action" }
      )
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
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
            init = function()
               vim.g.code_action_menu_window_border = "rounded"
               vim.g.code_action_menu_show_details = false
               vim.g.code_action_menu_show_action_kind = false
               vim.g.code_action_menu_show_diff = true
            end,
         },
         {
            "kosayoda/nvim-lightbulb",
            opts = {
               autocmd = { enabled = true },
               sign = {
                  enabled = true,
                  text = "",
               },
            },
         },
         { "williamboman/mason-lspconfig.nvim", config = false }, -- configure below
      },
      config = function()
         -- vim.lsp.set_log_level("trace")
         --
         local lspconfig = require("lspconfig")

         local jsTools = {
            require("efmls-configs.formatters.eslint_d"),
            -- require("efmls-configs.formatters.prettier_d"),
            -- require("efmls-configs.linters.eslint_d"), -- Use `eslint` language-server
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

         local servers = {
            cssls = {},
            efm = {
               filetypes = vim.tbl_keys(languages),
               init_options = {
                  documentFormatting = true,
                  documentFormattingRange = true,
                  codeAction = true,
               },
               settings = {
                  rootMarkers = { ".git/" },
                  languages = languages,
               },
            },
            eslint = {},
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
            tsserver = {
               root_dir = function(startPath)
                  if vue_root_path(startPath) then
                     return nil
                  end

                  return lspconfig.util.root_pattern("tsconfig.json")(startPath)
               end,
               on_attach = function(client, bufnr)
                  -- Detach from Vue projects
                  print(vim.inspect(vim.api.nvim_buf_get_name(bufnr)))

                  if vue_root_path(vim.api.nvim_buf_get_name(bufnr)) then
                     client.stop()
                  end
               end,
            },
            volar = {
               filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "json" },
               root_dir = vue_root_path,                                        -- only for projects with vue
               on_attach = function(client)
                  client.server_capabilities.documentFormattingProvider = false -- Use efm's Eslint/Prettier instead
               end,
            },
            yamlls = {},
         }

         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

         require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
         require("mason-lspconfig").setup_handlers({
            function(server_name)
               local server = lspconfig[server_name]
               server.setup(vim.tbl_deep_extend("force", servers[server_name] or {}, {
                  capabilities = capabilities,
               }))
            end,
         })
      end,
   },
   {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = {
         text = { spinner = "dots" },
      },
   },
}
