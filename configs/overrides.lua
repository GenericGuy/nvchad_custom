local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "c",
    "cpp",
    "cmake",
    "devicetree",
    "diff",
    "dockerfile",
    "python",
    "rust",
    "toml",
    "yaml",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "bash-language-server",
    "clangd",
    "clang-format",
    "cmake-language-server",
    "cmakelang",
    "pyright",
    "rust-analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
