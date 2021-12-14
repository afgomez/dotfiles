local nvim_lsp = require('lspconfig')
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local language_servers = {
  'cssls',
  'eslint',
  'html',
  'jsonls',
  'solargraph',
  'sumneko_lua',
  'rust_analyzer',
  'tsserver',
  'vimls',
  'yamlls',
}

-- Enable autocomplete using LSP
local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require'keymaps'.lsp_keymap(bufnr)
end

-- Ensure language servers are installed
for _, lang_server in ipairs(language_servers) do
    local server_available, requested_server = lsp_installer_servers.get_server(lang_server)
    if server_available then
        requested_server:on_ready(function ()
            local opts = {}
            if lang_server == 'sumneko_lua' then
              opts = require('lua-dev').setup()
            end

            opts.on_attach = on_attach
            opts.flags = {
              debounce_text_changes = 150,
            }

            requested_server:setup(opts)
        end)
        if not requested_server:is_installed() then
             -- Queue the server to be installed
            requested_server:install()
        end
    end
end

-- local function setup_servers()
--   for _, server in pairs(servers) do
--     local opts = {}

--     if server == 'lua' then
--       opts = require('lua-dev').setup()
--     end

--     opts.on_attach = on_attach
--     opts.flags = {
--       debounce_text_changes = 150,
--     }

--     nvim_lsp[server].setup(opts)
--   end
-- end

-- setup_servers()

-- lsp_installer.post_install_hook = function ()
--   setup_servers()
--   vim.cmd('bufdo e')
-- end
