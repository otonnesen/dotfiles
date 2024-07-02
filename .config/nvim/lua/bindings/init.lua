-- Guideline
vim.cmd("highlight ColorColumn ctermbg=16")
vim.api.nvim_set_keymap(
  "n",
  "<leader>y",
  [[<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>]],
  { noremap = true }
)

-- Spellcheck
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>setlocal spell! spelllang=en_ca<CR>", {})

-- Replace all with s
vim.api.nvim_set_keymap("n", "S", ":%s//g<left><left>", { noremap = true })

-- Visual  mode indent
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })

-- Make Y behave like D
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- Git commands
function ToggleGBlame()
  local gblame = vim.fn.matchstr(vim.fn.bufname("%"), "^.*.fugitiveblame$")
  if gblame == "" then
    vim.cmd("Git blame")
  else
    vim.cmd("q")
  end
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua ToggleGBlame()<CR>", { noremap = true })

-- Goyo for prose
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Goyo | set linebreak<CR>", {})

-- Tagbar
-- vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Tagbar<CR>", {})

-- Outline
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Outline!<CR>", {})

-- Shorter movement commands
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

-- Tab movement commands
vim.api.nvim_set_keymap("n", "<C-n>", ":tabn<CR>", {})
vim.api.nvim_set_keymap("n", "<C-p>", ":tabp<CR>", {})

vim.api.nvim_set_keymap("n", "<C-w>t", ":tabnew %<CR>", {})

-- Unmap F1 for help
vim.api.nvim_set_keymap("n", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("v", "<F1>", "<nop>", {})

-- NvimTree
vim.api.nvim_set_keymap("n", "<F1>", [[<cmd>NvimTreeToggle<CR>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<F2>", [[<cmd>NvimTreeFindFileToggle<CR>]], { noremap = true })

function ToggleStuff()
  vim.cmd("execute 'set number! relativenumber! signcolumn=' . (&signcolumn == 'no' ? 'yes:1' : 'no')")
  vim.cmd("execute 'Gitsigns toggle_current_line_blame'")
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end

vim.api.nvim_set_keymap(
  "n",
  "yoo",
  [[<cmd>lua ToggleStuff()<CR>]],
  { noremap = true }
)

function ToggleFormatExpr()
  local formatexpr = vim.api.nvim_buf_get_option(0, "formatexpr")
  if formatexpr == "" then
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  else
    vim.api.nvim_buf_set_option(0, "formatexpr", "")
  end
end

vim.api.nvim_set_keymap(
  "n",
  "yof",
  [[<cmd>lua ToggleFormatExpr()<CR>]],
  { noremap = true }
)
