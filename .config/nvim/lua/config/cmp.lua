-- Bind additional completion capabilities to language servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "neorg" },
    { name = "orgmode" },
  },
  -- sorting = {
  --   comparators = {
  --       cmp.config.compare.offset,
  --       cmp.config.compare.exact,
  --       cmp.config.compare.score,
  --       function(a1, a2)
  --         if a1 == "Variable" and a2 == "Method" or a2 == "Function" then
  --           return true
  --         end
  --         return false
  --       end,
  --       cmp.config.compare.sort_text,
  --       cmp.config.compare.length,
  --       cmp.config.compare.order,
  --   },
  -- },
})
