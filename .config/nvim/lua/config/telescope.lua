vim.api.nvim_set_keymap(
  "n",
  "<C-\\>",
  [[<cmd>lua require("telescope.builtin").find_files()<CR>]],
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>\\",
  [[<cmd>lua require("telescope.builtin").live_grep()<CR>]],
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "z=",
  [[<cmd>lua require("telescope.builtin").spell_suggest()<CR>]],
  { noremap = true }
)
