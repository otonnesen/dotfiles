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

local clang_format = function()
	return {
		exe = "clang-format",
		args = { "-i" },
		stdin = false,
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
						"--no-space-function",
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
		toml = {
			function()
				return {
					exe = "taplo",
					args = { "format", "--option", "indent_string='    '" },
				}
			end,
		},
		typespec = {
			function()
				return {
					exe = "tsp",
					args = { "format" },
					try_node_modules = true,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "goimports",
					args = { "-w" },
				}
			end,
			function()
				return {
					exe = "goimports-reviser",
				}
			end,
			function()
				return {
					exe = "golines",
					args = { "--chain-split-dots", "-w" },
				}
			end,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		html = {},
		c = { clang_format },
		cpp = { clang_format },
		nginx = {
			function()
				return {
					exe = "nginxfmt",
				}
			end,
		},
		dockerfile = {
			function()
				print("dockerfile")
				return {
					exe = "dockerfmt",
					args = { "-w" },
				}
			end,
		},
		terraform = {
			function()
				return {
					exe = "terraform",
					args = { "fmt" },
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<F3>", [[<cmd>Format<CR>]], { noremap = true, silent = true })
