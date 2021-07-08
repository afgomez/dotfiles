local execute = vim.api.nvim_command


-- Download packer if it's the first load
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'kabouzeid/nvim-lspinstall'
  }

  use 'folke/lua-dev.nvim'

  use 'hrsh7th/nvim-compe'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Other
  use 'afgomez/vim-whitespace'
  use 'andymass/vim-matchup'
  use 'editorconfig/editorconfig-vim'
  use 'farmergreg/vim-lastplace'
  use 'shaunsingh/nord.nvim'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)
