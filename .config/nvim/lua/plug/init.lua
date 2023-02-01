-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

local use = require("packer").use
require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- use("axvr/org.vim") -- Dumb emacs org mode integration

  use({
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup({})
    end,
  }) -- Potentially not-dumb emacs org mode integration?

  use("fatih/vim-go") -- Go utils

  -- Completion
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")

  -- Extra snippets
  use("rafamadriz/friendly-snippets")

  use("jrozner/vim-antlr") -- ANTLR

  use("junegunn/goyo.vim") -- Reader mode

  use("leafgarland/typescript-vim") -- TS utils

  use("lervag/vimtex") -- LaTeX utils

  use("majutsushi/tagbar") -- Tag browswer

  use("MaxMEllon/vim-jsx-pretty") -- JSX utils

  use("neovim/nvim-lspconfig") -- Neovim LSP defaults

  use("neovimhaskell/haskell-vim") -- Haskell utils

  -- Misc. utils required for other plugins
  use({ "nvim-lua/popup.nvim", requires = {
    "nvim-lua/plenary.nvim",
  } })

  use("nvim-telescope/telescope.nvim") -- Fuzzy finder

  use("nvim-treesitter/nvim-treesitter") -- Tree-sitter nvim interface

  use("psf/black") -- Python formatting

  use("rust-lang/rust.vim") -- Rust utils

  -- Python import sorting
  use("stsewd/isort.nvim") --, { "do": ":UpdateRemoteuseins" }

  -- Misc. general utils
  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")

  use("vimwiki/vimwiki") -- Wiki plugin

  use({ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }) -- Colorscheme

  -- Statusline
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  -- Norg mode
  use({ "nvim-neorg/neorg", requires = { "nvim-lua/plenary.nvim" } })

  -- Treesitter text object plugin
  -- use({
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  -- })
  -- Treesitter debugger
  use({ "nvim-treesitter/playground", requires = { "nvim-treesitter/nvim-treesitter" } })

  -- use({
  --   "vim-airline/vim-airline",
  --   requires = { "vim-airline/vim-airline-themes" },
  -- })

  use("mfussenegger/nvim-dap")

  use("jose-elias-alvarez/null-ls.nvim")

  use("nanotee/sqls.nvim")

  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

  use("norcalli/nvim-colorizer.lua")

  use("williamboman/mason.nvim")

  use("lewis6991/gitsigns.nvim")

  -- use("m4xshen/autoclose.nvim")
end)
