require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        -- neorg_leader = "<Leader>n",
      },
    },
    ["core.integrations.treesitter"] = {
      config = {
        enable = true,
      },
    },
    ["core.concealer"] = {
      config = {
        enable = true,
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          default = "~/notes/neorg",
          pani = "~/panidigital/notes",
        },
        autochdir = true,
        index = "index.norg",
      },
    },
    -- ["core.completion"] = {
    --   config = {
    --     engine = "nvim-cmp",
    --   },
    -- },
    ["core.qol.toc"] = {},
    ["core.journal"] = {},
    ["core.looking-glass"] = {},
  },
})
