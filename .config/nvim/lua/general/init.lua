local set = vim.o
-- Line nums + relative line nums
set.number = true
set.relativenumber = true

-- Show matching parens/brackets/etc.
set.showmatch = true

-- Make ~ behave as an operator
set.tildeop = true

-- Only show selected search match
set.hlsearch = false

-- Show `^M`s in dos files
set.ffs = "unix"

-- Full-screen statusline
set.laststatus = 3

-- set.autochdir  = true

-- Python host prog
vim.cmd([[
  let g:python3_host_prog = '/home/oliver/.config/nvim/host_prog/bin/python'
  let g:loaded_python_provider = 0
]])

-- Default to all folds open
set.foldlevel = 20
-- Default to all folds closed
-- set.foldlevel = 0
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Colour scheme
set.termguicolors = true
-- vim.g.airline_theme = "base16_gruvbox_dark_hard"
-- vim.cmd("colorscheme gruvbox")
set.background = "dark"

-- Give backspace default functionality
set.backspace = ""

-- Write errors in linenumber column
set.signcolumn = "yes:1"

vim.g.go_fmt_command = "goimports"

-- Indents
set.autoindent = true
set.smartindent = true

-- Tabs := 4 spaces (by default)
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.expandtab = true

-- Command-mode autocompletion
set.wildmode = "longest,list,full"

-- Set listchars
set.listchars = "tab:>-,trail:~,extends:>,precedes:<,space:."

-- Recursively look for tags file in `./[../]*.git/tags` or `./[../]*tags`.
-- Generate tags files from in .git directory with `ctags -R ..` or from  in
-- the base project directory with `ctags -R .`.
set.tags = "TAGS;/,.git/TAGS;/,tags;/,.git/tags;/"

-- 🤷
vim.cmd("hi menu guibg=#000000")

-- Set completion options
set.completeopt = "menu,menuone,noselect"

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

set.mouse = nil

vim.cmd([[
function! Scratch()
  vsplit
  noswapfile hide enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal nobuflisted
  lcd ~
  file scratch
endfunction
]])
