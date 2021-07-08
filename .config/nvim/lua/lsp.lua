local nvim_lsp = require('lspconfig')
-- local lsp_installer = require('nvim-lsp-installer')
local lsp_installer = require('lspinstall')

lsp_installer.setup()

local languages = {
  'css',
  'html',
  'json',
  'lua',
  'rust',
  'typescript',
  'yaml',
}

-- Ensure language servers are installed
for _, lang in ipairs(languages) do
  if not lsp_installer.is_server_installed(lang) then
    lsp_installer.install_server(lang)
  end
end



local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require'keymaps'.lsp_keymap(bufnr)
end


local function setup_servers()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local opts = {
        on_attach = on_attach,
    }

    nvim_lsp[server].setup(opts)
  end
end

setup_servers()

lsp_installer.post_install_hook = function ()
  setup_servers()
  vim.cmd('bufdo e')
end
