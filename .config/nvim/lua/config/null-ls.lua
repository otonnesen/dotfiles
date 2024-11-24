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

    -- I don't use these anymore
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,

    -- Broken
    -- null_ls.builtins.formatting.json_tool,
    null_ls.builtins.formatting.ocamlformat,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.pg_format.with({
      extra_args = {
        "--type-case",
        "1",
        "--keyword-case",
        "1",
        "--comma-start",
        "--wrap-comment",
      },
    }),
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.goimports,

    -- Broken
    -- null_ls.builtins.formatting.fourmolu,

    -- null_ls.builtins.formatting.elm_format,
  },
})

vim.keymap.set("n", "<F3>", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })
