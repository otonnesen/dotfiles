local nvim_tree = require("nvim-tree")

nvim_tree.setup({})
vim.api.nvim_set_keymap("n", "<F1>", [[<cmd>NvimTreeToggle<CR>]], { noremap = true })
