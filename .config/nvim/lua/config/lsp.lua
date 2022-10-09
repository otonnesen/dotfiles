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
lspconfig.ccls.setup({})
lspconfig.bashls.setup({})
lspconfig.jsonls.setup({})
lspconfig.terraformls.setup({})
lspconfig.dockerls.setup({})
lspconfig.elixirls.setup({})
lspconfig.elixirls.setup({
  cmd = { "/home/oliver/.local/share/nvim/mason/bin/elixir-ls" },
})
lspconfig.hls.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
})
lspconfig.tsserver.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
})
lspconfig.sqls.setup({
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
})

vim.diagnostic.config({
  underline = true,
})

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
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", {
  noremap = true,
})
