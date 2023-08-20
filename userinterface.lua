local M = {
  theme = "onedark",

  -- Overrides for making diffview work
  -- Source: copied from original onedark repo:
  --    https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
  --    https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua
  hl_override = {
    DiffAdd = {
      fg = "none",
      bg = "#31392b",
    },
    DiffDelete = {
      fg = "none",
      bg = "#382b2c",
    },
    DiffChange = {
      fg = "none",
      bg = "#1c3448",
    },
    DiffText = {
      fg = "none",
      bg = "#2c5372",
    },
  },

  statusline = {
    theme = "vscode",
  },
}

return M
