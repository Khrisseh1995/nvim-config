-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'arcticicestudio/nord-vim'
  use "EdenEast/nightfox.nvim"
  use 'folke/tokyonight.nvim'
  use 'feline-nvim/feline.nvim'
  use  'b0o/incline.nvim'
  use 'nvim-lualine/lualine.nvim'
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim'
  -- use 'nanozuki/tabby.nvim'
  use 'tpope/vim-surround'
  use 'norcalli/nvim-colorizer.lua'
  use 'ray-x/lsp_signature.nvim'
  use 'andymass/vim-matchup'
  use 'max397574/better-escape.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'windwp/nvim-autopairs'
  use 'folke/trouble.nvim'
  use 'simrat39/rust-tools.nvim'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup()
    end
  }
end)

-- Plugin configuration files
require('plugin-settings.bufferline')
require('plugin-settings.completion')
require('plugin-settings.gitsigns')
require('plugin-settings.lualine')
require('plugin-settings.winbar')
require('plugin-settings.nvimtree')
-- require('plugin-settings.tabby')
require('plugin-settings.telescope')
require('plugin-settings.treesitter')
require('plugin-settings.troublenvim')
