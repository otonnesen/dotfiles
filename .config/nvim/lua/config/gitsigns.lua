require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 0,
  },
})

vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>:Gitsigns toggle_current_line_blame<CR>", {
  noremap = true,
})
