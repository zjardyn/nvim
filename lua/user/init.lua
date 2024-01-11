-- loads lua modules 
require("user.remapping")
require("user.settings")

-- boostrap lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- installs plugins (also loads and configures them)
-- Other dir to load and configure is ~/.config/nvim/after/plugin
require('lazy').setup({
  { "numToStr/FTerm.nvim"},
  { "jalvesaq/Nvim-R", lazy = false,
    version = "0.9.19"
  },
  { 'mrjones2014/smart-splits.nvim' },
  { 'nvim-lualine/lualine.nvim', },
  { 'numToStr/Comment.nvim', opts = {} },
  'tpope/vim-sleuth',
  { 'rose-pine/neovim', name = 'rose-pine',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'jalvesaq/cmp-nvim-r'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/nvim-cmp'},
  {'saadparwaiz1/cmp_luasnip'},
  {'L3MON4D3/LuaSnip'},
  {'folke/neodev.nvim'},
  {'simrat39/rust-tools.nvim'},
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {'nvim-tree/nvim-tree.lua'},
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true
  }
})
