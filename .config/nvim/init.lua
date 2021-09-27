-- Alias vim.fn
local fn = vim.fn
local execute = vim.api.nvim_command

-- Install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.execute("!git clone https://github.com/wbthomason/packer.nvim "
    .. install_path)
end

vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]], false
)

local use = require("packer").use
require("packer").startup(function()
  use "axvr/org.vim"
  use "fatih/vim-go"
  use "hrsh7th/nvim-compe"
  use "hrsh7th/vim-vsnip"
  use "jrozner/vim-antlr"
  use "junegunn/goyo.vim"
  use "leafgarland/typescript-vim"
  use "lervag/vimtex"
  use "majutsushi/tagbar"
  use "mxw/vim-jsx"
  use "neovim/nvim-lspconfig"
  use "vhyrro/neorg"
  use "neovimhaskell/haskell-vim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-treesitter/nvim-treesitter" }
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter/nvim-treesitter" }
  }
  use {
    "nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" }
  }
  use "psf/black"
  use {
    "npxbr/gruvbox.nvim",
    requires = { use "rktjmp/lush.nvim" }
  }
  use "romgrk/nvim-treesitter-context"
  use "rust-lang/rust.vim"
  use "stsewd/isort.nvim"--, { "do": ":UpdateRemoteuseins" }
  use "tpope/vim-commentary"
  use "tpope/vim-fugitive"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use {
    "vim-airline/vim-airline",
    requires = { "vim-airline/vim-airline-themes" }
  }
  use "vimwiki/vimwiki"
end)

vim.g.mapleader = " "

local set = vim.o

execute("syntax enable")
execute("filetype plugin indent on")

-- Unmap F1
vim.api.nvim_set_keymap("n", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("v", "<F1>", "<nop>", {})


set.compatible = false
set.encoding = "utf-8"
set.number = true
set.relativenumber = true
set.showmatch = true
set.tildeop = true
set.hlsearch = false

-- Default to all folds open
set.foldlevel = 20

-- Colour scheme
set.termguicolors = true
vim.g.airline_theme = "base16_gruvbox_dark_hard"
execute("colorscheme gruvbox")
set.background = "dark"

-- Give backspace default functionality
set.backspace = ""

-- Write errors in linenumber column
set.signcolumn = "number"

vim.g.go_fmt_command = "goimports"

-- Indents
set.autoindent = true
set.smartindent = true
-- Tabs := 4 spaces
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.expandtab = true

-- Command-mode autocompletion
set.wildmode = "longest,list,full"

-- Set listchars
set.listchars = "tab:>-,trail:~,extends:>,precedes:<,space:."

-- Git commands
function ToggleGBlame()
  local gblame = fn.matchstr(fn.bufname("%"), "/tmp/.*fugitiveblame")
  if gblame == ""
  then
    execute("Git blame")
  else
    execute("q")
  end
end
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua ToggleGBlame()<CR>",
  { noremap = true })

-- Guideline
vim.cmd("highlight ColorColumn ctermbg=16")
vim.api.nvim_set_keymap("n", "<leader>y",
  [[<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>]],
  { noremap = true })

-- Goyo for prose
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Goyo | set linebreak<CR>", {})

-- Spellcheck
vim.api.nvim_set_keymap("n", "<leader>s",
  "<cmd>setlocal spell! spelllang=en_ca<CR>", {})

-- Tagbar
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Tagbar<CR>", {})

-- Replace all with S
vim.api.nvim_set_keymap("n", "S", ":%s//g<Left><Left>", { noremap = true })

-- Make Y behave like D
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- Recursively look for tags file in `./[../]*.git/tags` or `./[../]*tags`.
-- Generate tags files from in .git directory with `ctags -R ..` or from  in
-- the base project directory with `ctags -R .`.
set.tags = "TAGS;/,.git/TAGS;/,tags;/,.git/tags;/"

-- Shorter movement commands
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

-- Tab movement commands
vim.api.nvim_set_keymap("n", "<C-n>", ":tabn<CR>", {})
vim.api.nvim_set_keymap("n", "<C-p>", ":tabp<CR>", {})

-- Language servers
require("lspconfig").pyright.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").hls.setup({})

-- LSP binds
vim.api.nvim_set_keymap("n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",
  { noremap = true })

-- Treesitter textobjects
require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
        },
      },
    },
    -- TODO: Really cool, but I can't find a good keybind for this!
    -- lsp_interop = {
    --   enable = true,
    --   peek_definition_code = {
    --     [--df--] = --@function.outer--,
    --     [--dF--] = --@class.outer--,
    --   },
    -- }
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
})

-- Neorg
require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
      },
    },
    -- ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          default = "~/notes/neorg"
        },
      },
    },
  },
})

local parser_configs = require"nvim-treesitter.parsers".get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c" },
    branch = "main"
  },
}

-- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
-- And allows you to shove every Neorg keybind under one "umbrella".
local neorg_leader = "<Leader>o" -- You may also want to set this to <Leader>o for "organization"

-- Require the user callbacks module, which allows us to tap into the core of Neorg
local neorg_callbacks = require("neorg.callbacks")

-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
-- needs to reevaluate all the bound keys is invoked
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

	-- Map all the below keybinds only when the "norg" mode is active
	keybinds.map_event_to_mode("norg", {
		n = { -- Bind keys in normal mode

			-- Keys for managing TODO items and setting their states
			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
			{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }

		},
	}, { silent = true, noremap = true })

end)

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Telescope
vim.api.nvim_set_keymap("n", "<C-\\>", [[<cmd>lua require("telescope.builtin").find_files()<CR>]],
  { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>\\", [[<cmd>lua require("telescope.builtin").live_grep()<CR>]],
  { noremap = true })
vim.api.nvim_set_keymap("n", "z=", [[<cmd>lua require("telescope.builtin").spell_suggest()<CR>]],
  { noremap = true })

-- Compe
set.completeopt = "menuone,noselect"

require("compe").setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = "enable";
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    nvim_treesitter = true;
    vsnip = true;
    ultisnips = true;
  };
})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
  { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')",
  { noremap = true, silent = true, expr = true })

-- vimwiki config
vim.cmd([[
  let personal = {}
  let personal.path = "~/notes/wikis/personal"
  let personal.nested_syntaxes = {"go": "go", "python": "python"}
  let g:vimwiki_list = [personal]
]])
