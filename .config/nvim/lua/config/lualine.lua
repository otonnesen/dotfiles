-- require("lualine").setup({
--   options = { theme = "gruvbox" },
-- })

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

local gruvbox_colours = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  gray = "#928374",
}

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = gruvbox_colours.dark0_soft,
  fg       = gruvbox_colours.light0_soft,
  yellow   = gruvbox_colours.faded_yellow,
  cyan     = gruvbox_colours.faded_aqua,
  darkblue = gruvbox_colours.faded_blue,
  green    = gruvbox_colours.faded_green,
  orange   = gruvbox_colours.faded_orange,
  violet   = gruvbox_colours.faded_purple,
  magenta  = gruvbox_colours.bright_purple,
  blue     = gruvbox_colours.bright_blue,
  red      = gruvbox_colours.bright_red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    globalstatus = true,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command(
      "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg
    )
    return ""
  end,
  color = "LualineMode",
  padding = { right = 1 },
})

ins_left({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_left({
--   function()
--     return "%="
--   end,
-- })

ins_right({
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
})


ins_right({
  "filetype",
})

-- Add components to right sections
ins_right({
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
})

ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
