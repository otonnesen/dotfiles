return {
	-- Go development
	{
		"fatih/vim-go",
		ft = "go",
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
		},
		ft = "go",
		config = function()
			require("go").setup({
				lsp_cfg = false,
			})
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
		},
	},

	-- Language support
	{
		"jrozner/vim-antlr",
		ft = "antlr",
	},
	-- {
	-- 	"leafgarland/typescript-vim",
	-- 	ft = { "typescript", "typescriptreact" },
	-- },
	{
		"lervag/vimtex",
		ft = "tex",
	},
	{
		"MaxMEllon/vim-jsx-pretty",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	{
		"neovimhaskell/haskell-vim",
		ft = "haskell",
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
	},
	{
		"alaviss/nim.nvim",
		ft = "nim",
	},

	-- Core utilities
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"nvim-lua/popup.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
	},

	-- General utilities
	{
		"tpope/vim-commentary",
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gdiff", "Gstatus", "Gblame" },
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
	},

	-- UI enhancements
	{
		"junegunn/goyo.vim",
		cmd = "Goyo",
	},
	{
		"majutsushi/tagbar",
		cmd = "TagbarToggle",
	},
	{
		"npxbr/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	},

	-- Neorg
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/lua-utils.nvim",
			"nvim-neotest/nvim-nio",
			"MunifTanjim/nui.nvim",
			"pysan3/pathlib.nvim",
		},
		ft = "norg",
	},

	-- LSP and Mason
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	-- DAP (Debug Adapter Protocol)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
		},
		cmd = { "DapToggleBreakpoint", "DapContinue" },
	},

	-- SQL
	{
		"nanotee/sqls.nvim",
		ft = "sql",
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Auto-completion utilities
	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
	},

	-- Color highlighting
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
		event = "InsertEnter",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"github/copilot.vim",
			"nvim-lua/plenary.nvim",
		},
		cmd = "CopilotChat",
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
			"marilari88/neotest-vitest",
		},
		cmd = { "Neotest" },
	},

	-- Code coverage
	{
		"andythigpen/nvim-coverage",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "Coverage" },
	},

	-- Code outline
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
	},

	-- Formatting and linting
	{
		"mhartington/formatter.nvim",
		cmd = { "Format", "FormatWrite" },
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
	},
}
