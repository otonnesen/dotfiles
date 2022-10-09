vim.cmd("highlight ColorColumn ctermbg=16")
vim.cmd("hi SignColumn guibg=background")
-- De-italicize operators (in particular, python's `|`).
vim.cmd("hi Operator cterm=NONE gui=NONE")
