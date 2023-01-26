local execute = vim.api.nvim_command

-- Download packer if it's the first load
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  use 'folke/neodev.nvim'

  use 'hrsh7th/nvim-compe'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Other
  use 'Mofiqul/vscode.nvim'
  use 'afgomez/vim-whitespace'
  use 'andymass/vim-matchup'
  use 'editorconfig/editorconfig-vim'
  use 'farmergreg/vim-lastplace'
  use 'shaunsingh/nord.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'windwp/nvim-autopairs'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
end)
