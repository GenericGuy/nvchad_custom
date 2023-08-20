local overrides = require("custom.configs.overrides")
local cmp = require("cmp")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function() require("custom.configs.null-ls") end,
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<C-j>"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"] = cmp.mapping.scroll_docs(4),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    },
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    config = function() require("diffview").setup() end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      -- default config function's stuff
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      -- your custom stuff
      require("which-key").register({
        f = { name = "find" },
        l = { name = "lsp" },
        g = { name = "git" },
        m = { name = "map" },
        d = { name = "diffview" },
      }, { prefix = "<leader>" })
    end,
  },
  {
    "unblevable/quick-scope",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },

    opts = {
      delay = 200,
      -- For large files illuminate gets slow -> only use lsp in this case
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },

    config = function(_, opts)
      require("illuminate").configure(opts)
      -- Change highlighting to block (default is underlined)
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,

    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "mbbill/undotree",
    event = { "BufReadPost", "BufNewFile" },
  },
}

return plugins
