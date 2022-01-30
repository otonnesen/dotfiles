require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>n",
      },
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          todo = {
            enabled = true,
            done = {
              enabled = true,
              icon = "✓",
            },
            pending = {
              enabled = true,
              icon = "⭮",
            },
            undone = {
              enabled = true,
              icon = "⨯",
            },
          },
        },
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          default = "~/notes/neorg",
          pani = "~/panidigital/notes",
        },
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.norg.qol.toc"] = {},
    ["core.norg.journal"] = {},
  },
})
