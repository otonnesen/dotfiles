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

	-- use({
	-- 	"nvim-orgmode/orgmode",
	-- 	config = function()
	-- 		require("orgmode").setup({})
	-- 	end,
	-- }) -- Potentially not-dumb emacs org mode integration?

	use("fatih/vim-go") -- Go utils
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")
	require("go").setup({
		lsp_cfg = false,
	})

	-- Completion
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-vsnip")
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

	use("neovimhaskell/haskell-vim") -- Haskell utils

	-- Misc. utils required for other plugins
	use({
		"nvim-lua/popup.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use("nvim-telescope/telescope.nvim") -- Fuzzy finder

	use({
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
	}) -- Tree-sitter nvim interface

	-- use("psf/black") -- Python formatting

	use("rust-lang/rust.vim") -- Rust utils

	-- Python import sorting
	-- use("stsewd/isort.nvim") --, { "do": ":UpdateRemoteuseins" }

	-- Misc. general utils
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")

	-- use("vimwiki/vimwiki") -- Wiki plugin

	use({ "npxbr/gruvbox.nvim" }) -- Colorscheme

	-- Statusline
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	-- Norg mode
	use({
		"nvim-neorg/neorg",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/lua-utils.nvim",
			"nvim-neotest/nvim-nio",
			"MunifTanjim/nui.nvim",
			"pysan3/pathlib.nvim",
		},
	})

	-- Treesitter text object plugin
	-- use({
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	after = "nvim-treesitter",
	-- 	requires = "nvim-treesitter/nvim-treesitter",
	-- })

	-- use({
	--   "vim-airline/vim-airline",
	--   requires = { "vim-airline/vim-airline-themes" },
	-- })

	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")

	-- use({ "nvimtools/none-ls.nvim", requires = { "nvimtools/none-ls-extras.nvim" } })

	use("nanotee/sqls.nvim")

	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

	use("norcalli/nvim-colorizer.lua")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig", -- Neovim LSP defaults
		opts = {
			inlay_hints = { enabled = true },
		},
	})

	use("lewis6991/gitsigns.nvim")

	use("m4xshen/autoclose.nvim")

	use("alaviss/nim.nvim")

	-- use({
	--   "jpalardy/vim-slime",
	--   init = function()
	--     vim.g.slime_target = "tmux"
	--   end,
	-- })

	use("github/copilot.vim")
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		requires = {
			"github/copilot.vim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- use({
	--   "pmizio/typescript-tools.nvim",
	--   requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- })

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})

	use("nvim-neotest/neotest-python")
	use("nvim-neotest/neotest-plenary")
	use("nvim-neotest/neotest-vim-test")
	use("marilari88/neotest-vitest")

	use({
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
	})

	use("hedyhli/outline.nvim")

	use("mhartington/formatter.nvim")
	use("mfussenegger/nvim-lint")

	-- use("romgrk/barbar.nvim")
end)
