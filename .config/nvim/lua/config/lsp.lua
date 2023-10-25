local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local root_files = {
  "pyproject.toml",
  -- 'setup.py',
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
}

lspconfig.pyright.setup({
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
        },
      },
    },
  },
})
lspconfig.gopls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.ccls.setup({
  init_options = {
    cache = {
      directory = ".ccls-cache",
    },
  },
})
lspconfig.bashls.setup({})
lspconfig.jsonls.setup({})
lspconfig.html.setup({})
lspconfig.terraformls.setup({})
lspconfig.dockerls.setup({})
lspconfig.elmls.setup({})
lspconfig.svelte.setup({})
lspconfig.eslint.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
})
lspconfig.nimls.setup({ single_file_support = true })
lspconfig.elixirls.setup({
  cmd = { "/home/oliver/.local/share/nvim/mason/bin/elixir-ls" },
})
lspconfig.hls.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
})
-- require("typescript-tools").setup({})
lspconfig.tsserver.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
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
lspconfig.postgres_lsp.setup({})
lspconfig.rnix.setup({})
lspconfig.ruff_lsp.setup({})
lspconfig.jqls.setup({})
lspconfig.lua_ls.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
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
-- lspconfig.yamlls.setup({})
lspconfig.ocamllsp.setup({})

vim.diagnostic.config({
  underline = true,
})

function filter(arr, func)
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
vim.api.nvim_set_keymap(
  "n",
  "[g",
  "<cmd>lua vim.diagnostic.goto_prev()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "]g",
  "<cmd>lua vim.diagnostic.goto_next()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gh",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gr",
  "<cmd>lua vim.lsp.buf.references()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {
  noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
  noremap = true,
})
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
  noremap = true,
})
