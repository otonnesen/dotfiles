-- Norg treesitter parser
-- NOTE: This has to run before the `nvim-treesitter.configs` setup
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {"org"},
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>v",
      node_decremental = "<leader>j",
      node_incremental = "<leader>k",
      scope_incremental = "<leader>K",
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
        },
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
})

-- This breaks syntax highlighting for some reason. It seems to work fine when
-- enabled per-filetype in nvim/after/ftplugin/{filetype}.vim
-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"

-- Treesitter Text Objects
vim.api.nvim_set_keymap(
  "n",
  "<leader>snf",
  "<cmd>TSTextobjectSwapNext @function.outer<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>spf",
  "<cmd>TSTextobjectSwapPrevious @function.outer<CR>",
  { noremap = true }
)

-- Treesitter highlighting defaults Python keyword operators (`and`, `in`,
-- etc.) to be highlighted the same as regular operators (`&`, `==`, etc.) i.e.
-- white instead of red, which looks pretty odd. This instead maps them to be
-- highlighted the same as regular keywords (`for`, `def`, etc.) which seems
-- more coherent.
vim.cmd("highlight link pythonTSKeywordOperator Keyword")
