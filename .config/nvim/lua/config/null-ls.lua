local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        "--indent-width",
        "2",
        "--indent-type",
        "Spaces",
        "--line-endings",
        "Unix",
        "--column-width",
        "99",
        "--quote-style",
        "AutoPreferDouble",
      },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.json_tool,
    null_ls.builtins.formatting.sqlformat.with({
      extra_args = { "-k", '"lower"', "--reindent", "--comma_first" },
    }),
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.fourmolu,
    -- null_ls.builtins.formatting.elm_format,
  },
})

vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {})
