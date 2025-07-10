require("mason-lspconfig").setup({ automatic_enable = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[g", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, opts)
vim.keymap.set("n", "]g", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "g<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<space>f", function()
	vim.lsp.buf.format({ async = true })
end, opts)

vim.lsp.config("pyright", {
	root_markers = { "pyproject.toml" },
	settings = {
		python = {
			venvPath = "./",
			venv = "venv",
			pythonPlatform = "Linux",
			analysis = {
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "strict",
				diagnosticSeverityOverrides = {
					reportImportCycles = "error",
					reportMissingTypeStubs = "information",
					reportMatchNotExhaustive = "warning",
					reportCallInDefaultInitializer = "information",
					reportMissingTypeArgument = "warning",
					reportConstantRedefinition = "warning",
					reportDuplicateImport = "error",
					reportIncompatibleVariableOverride = "information",
					reportPrivateUsage = "error",
					reportUninitializedInstanceVariable = "warning",
					reportUnnecessaryComparison = "warning",
					reportUnnecessaryContains = "warning",
					reportUnnecessaryIsInstance = "information",
					reportUnnecessaryTypeIgnoreComment = "error",
					reportUntypedBaseClass = "information",
					reportUntypedNamedTuple = "warning",
					reportUnusedClass = "information",
					reportUnusedFunction = "information",
					reportUnusedImport = "information",
					reportUnusedVariable = "information",
					reportMissingParameterType = "warning",
					reportUnknownArgumentType = "none",
					reportUnknownLambdaType = "none",
					reportUnknownMemberType = "none",
					reportUnknownParameterType = "none",
					reportUnknownVariableType = "warning",
				},
			},
		},
	},
})

-- Not managed by Mason (we use the one in the venv), so we enable it manually
vim.lsp.enable("ruff")

-- lspconfig.basedpyright.setup({
-- 	on_attach = function(client, bufnr)
-- 		vim.lsp.inlay_hint.enable()
-- 		on_attach(client, bufnr)
-- 	end,
-- 	root_dir = util.root_pattern(unpack(root_files)),
-- 	settings = {
-- 		basedpyright = {
-- 			disableOrganizeImports = false,
-- 			analysis = {
-- 				diagnosticMode = "openFilesOnly",
-- 			},
-- 		},
-- 	},
-- })

vim.hl.priorities.semantic_tokens = 95

vim.filetype.add({
	pattern = {
		[".*.html.tmpl"] = "gohtmltmpl",
	},
})

-- lspconfig.html.setup({
-- 	on_attach = function(client, bufnr)
-- 		-- I like the HTML LSP formatting better than any other standalone
-- 		-- formatter, and I don't know how to get the LSP formatter to work with
-- 		-- formatter.nvim, so here we are
-- 		vim.keymap.set("n", "<F3>", function()
-- 			vim.lsp.buf.format({ async = true })
-- 		end, { noremap = true, silent = true, buffer = bufnr })
-- 		on_attach(client, bufnr)
-- 	end,
-- })

vim.lsp.config("ts_ls", {
	init_options = {
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
