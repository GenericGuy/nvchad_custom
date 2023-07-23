local M = {
  theme = "onedark",

  -- Overrides for making diffview work
  hl_override = {
    DiffAdd = {
      underline = false,
      bg = "nord_blue",
      fg = "darker_black",
    },
    DiffDelete = {
      underline = false,
      bg = "red",
      fg = "darker_black",
    },
    DiffChange = {
      underline = true,
      bg = "one_bg3",
    },
    DiffText = {
      bg = "yellow",
      fg = "darker_black",
    },
  },

  -- statusbar
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
  },
}

return M
