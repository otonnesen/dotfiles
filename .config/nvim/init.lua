vim.g.mapleader = " "

require("plug")
require("general")

require("config.cmp")
require("config.treesitter")
require("config.telescope")
require("config.lualine")
require("config.neorg")
-- require("config.vimwiki")
require("config.vsnip")
require("config.null-ls")
require("config.nvim-tree")
require("config.orgmode")
-- require("config.autoclose")
-- require("config.dap")
require("config.colorizer")
require("config.mason")
require("config.lsp")
require("config.gruvbox")
require("config.gitsigns")
-- require("config.slime")

-- This is last so it takes precedence over any config done by plugins. I'm
-- pretty sure the italic operator highlight is probably done by treesitter, so
-- this can likely be overridden there instead if I ever bother looking.
require("colours")

require("bindings")
require("config.neovide")
