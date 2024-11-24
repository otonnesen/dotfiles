-- Utilities for creating configurations
local util = require("formatter.util")

local js_prettier = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
		try_node_modules = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			function()
				return {
					exe = "ruff",
					args = { "format", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "ruff",
					args = { "check", "--select", "I", "--fix", "-" },
					stdin = true,
				}
			end,
		},
		sql = {
			function()
				return {
					exe = "pg_format",
					args = {
						"--type-case",
						"1",
						"--keyword-case",
						"1",
						"--comma-start",
						"--wrap-comment",
					},
					stdin = true,
				}
			end,
		},
		json = {
			function()
				return {
					exe = "jq",
					args = { ".", "--indent", "2" },
					stdin = true,
				}
			end,
		},
		javascript = { js_prettier },
		javascriptreact = { js_prettier },
		typescript = { js_prettier },
		typescriptreact = { js_prettier },
		go = {
			function()
				return {
					exe = "golines",
				}
			end,
			function()
				return {
					exe = "goimports",
				}
			end,
			function()
				return {
					exe = "goimports-reviser",
				}
			end,
		},
		html = {},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<F3>", [[<cmd>Format<CR>]], { noremap = true, silent = true })
