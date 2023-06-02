require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        -- neorg_leader = "<Leader>n",
      },
    },
    -- ["core.norg.concealer"] = {
    --   config = {
    --     icons = {
    --       todo = {
    --         enabled = true,
    --         done = {
    --           enabled = true,
    --           icon = "✓",
    --         },
    --         pending = {
    --           enabled = true,
    --           icon = "⭮",
    --         },
    --         undone = {
    --           enabled = true,
    --           icon = "⨯",
    --         },
    --       },
    --     },
    --   },
    -- },
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
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.qol.toc"] = {},
    ["core.journal"] = {},
  },
})
