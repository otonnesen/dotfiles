local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "g<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	-- vim.keymap.set("n", "<F3>", function()
	--   vim.lsp.buf.format({ async = true })
	-- end, bufopts)
end

local root_files = {
	"pyproject.toml",
	-- 'setup.py',
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
}

lspconfig.pyright.setup({
	on_attach = on_attach,
	root_dir = util.root_pattern(unpack(root_files)),
	settings = {
		python = {
			venvPath = "./",
			venv = "venv",
			pythonPlatform = "Linux",
			analysis = {
				diagnosticMode = "openFilesOnly",
				-- typeCheckingMode = "strict",
				diagnosticSeverityOverrides = {
					reportImportCycles = "error",
					-- reportMissingTypeStubs = "information",
					reportMissingImport = "error",
					reportMatchNotExhaustive = "warning",
					reportCallInDefaultInitializer = "information",
					reportFunctionMemberAccess = "information",
					reportMissingTypeArgument = "warning",
					reportUnnecessaryComparison = "warning",
					reportConstantRedefinition = "warning",
					reportDuplicateImport = "error",
					reportIncompatibleVariableOverride = "information",
					reportPrivateUsage = "error",
					-- reportUninitializedInstanceVariable = "warning",
					reportUnnecessaryIsInstance = "information",
					reportUnnecessaryTypeIgnoreComment = "error",
					reportUntypedBaseClass = "information",
					reportUntypedNamedTuple = "warning",
					reportUnusedClass = "information",
					reportUnusedFunction = "information",
					-- reportUnusedImport = "information",
					-- reportUnusedVariable = "information",
					reportMissingParameterType = "warning",
				},
			},
		},
	},
})
lspconfig.gopls.setup({
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
				fillreturns = true,
				unparam = true,
			},
			staticcheck = true,
			gofumpt = true,
			codelenses = {
				generate = true,
				-- gc_details = true,
				tidy = true,
				upgrade_dependency = true,
				test = true,
			},
		},
	},
})
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})
lspconfig.ccls.setup({
	init_options = {
		cache = {
			directory = ".ccls-cache",
		},
	},
})
lspconfig.bashls.setup({
	on_attach = on_attach,
})
lspconfig.jsonls.setup({})
lspconfig.html.setup({
	on_attach = function(client, bufnr)
    -- I like the HTML LSP formatting better than any other standalone
    -- formatter, and I don't know how to get the LSP formatter to work with
    -- formatter.nvim, so here we are
		vim.keymap.set("n", "<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, { noremap = true, silent = true, buffer = bufnr })
		on_attach(client, bufnr)
	end,
})
lspconfig.tailwindcss.setup({})
lspconfig.htmx.setup({
	on_attach = on_attach,
	filetypes = { "html", "gohtmltmpl" },
})
lspconfig.terraformls.setup({
	on_attach = on_attach,
	filetypes = { "hcl", "tf", "tfvars" },
})
lspconfig.dockerls.setup({
	on_attach = on_attach,
})
lspconfig.elmls.setup({
	on_attach = on_attach,
})
lspconfig.svelte.setup({
	on_attach = on_attach,
})
lspconfig.eslint.setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
})
lspconfig.nimls.setup({
	on_attach = on_attach,
	single_file_support = true,
})
lspconfig.elixirls.setup({
	on_attach = on_attach,
	cmd = { "/home/oliver/.local/share/nvim/mason/bin/elixir-ls" },
})
lspconfig.hls.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
})
-- require("typescript-tools").setup({})
lspconfig.ts_ls.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
})

vim.filetype.add({
	pattern = {
		["tspconfig.ya?ml"] = "yaml.tspconfig",
	},
})

lspconfig.tsp_server.setup({
	on_attach = on_attach,
	filetypes = { "typespec", "yaml.tspconfig" },
})
lspconfig.graphql.setup({
	-- Kind of a huge hack but I cannot figure out how to get raw vim.lsp.start()
	-- to work, and don't know how add a new server to lspconfig ¯\_(ツ)_/¯.
	root_dir = util.root_pattern("relay.config.json"),
	cmd = { "npx", "relay-compiler", "lsp" },
	filetypes = { "graphql", "javascript", "typescript", "typescriptreact", "javascriptreact" },
})
lspconfig.sqlls.setup({})
-- lspconfig.sqls.setup({
--   on_attach = function(client, bufnr)
--     require("sqls").on_attach(client, bufnr)
--   end,
-- })
-- lspconfig.postgres_lsp.setup({})
lspconfig.rnix.setup({})
lspconfig.ruff.setup({
	on_attach = on_attach,
	init_options = {
		settings = {
			args = {},
		},
	},
})
lspconfig.jqls.setup({})
lspconfig.lua_ls.setup({
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
lspconfig.yamlls.setup({ on_attach = on_attach })
lspconfig.ocamllsp.setup({
	on_attach = on_attach,
})
lspconfig.taplo.setup({})
-- lspconfig.nginx_language_server.setup({})
lspconfig.perlnavigator.setup({
	on_attach = on_attach,
})

vim.diagnostic.config({
	underline = true,
})

local filter = function(arr, func)
	-- Filter in place
	-- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do
		arr[i] = nil
	end
end

-- function filter_diagnostics(diagnostic)
-- 	-- Only filter out Pyright stuff for now
-- 	if diagnostic.source ~= "Pyright" then
-- 		return true
-- 	end

-- 	-- Allow variables starting with an underscore
-- 	if string.match(diagnostic.message, '"_.+" is not accessed') then
-- 		return false
-- 	end

-- 	return true
-- end

-- function custom_on_publish_diagnostics(a, params, client_id, c, config)
-- 	filter(params.diagnostics, filter_diagnostics)
-- 	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 	custom_on_publish_diagnostics, {})

-- LSP binds
-- BACKUP
-- local bufopts = { noremap = true, silent = true }
-- vim.keymap.set(
--   "n",
--   "[g",
--   "<cmd>lua vim.diagnostic.goto_prev()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "]g",
--   "<cmd>lua vim.diagnostic.goto_next()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "gd",
--   "<cmd>lua vim.lsp.buf.definition()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "gh",
--   "<cmd>lua vim.lsp.buf.hover()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "gr",
--   "<cmd>lua vim.lsp.buf.references()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {
--   noremap = true,
-- })
-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
--   noremap = true,
-- })
-- vim.keymap.set("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
--   noremap = true,
-- })
