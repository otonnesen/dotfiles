local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
})
lspconfig.gopls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.hls.setup({})
lspconfig.tsserver.setup({})

-- LSP binds
vim.api.nvim_set_keymap(
  "n",
  "[g",
  "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "]g",
  "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
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
