require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua.with({
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
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.isort,
    require("null-ls").builtins.formatting.json_tool,
    require("null-ls").builtins.formatting.sqlformat.with({
      extra_args = { "-k", "\"lower\"", "--reindent", "--comma_first" },
    }),
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.formatting.fourmolu,
    -- require("null-ls").builtins.formatting.elm_format,
  },
})

vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
