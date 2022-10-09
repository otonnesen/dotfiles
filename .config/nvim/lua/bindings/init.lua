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
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Tagbar<CR>", {})

-- Shorter movement commands
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

-- Tab movement commands
vim.api.nvim_set_keymap("n", "<C-n>", ":tabn<CR>", {})
vim.api.nvim_set_keymap("n", "<C-p>", ":tabp<CR>", {})

vim.api.nvim_set_keymap("n", "<C-w>t", ":tabnew %<CR>", {})

-- Unmap F1
vim.api.nvim_set_keymap("n", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<F1>", "<nop>", {})
vim.api.nvim_set_keymap("v", "<F1>", "<nop>", {})
