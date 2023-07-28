local M = {}

M.disabled = {
  n = {
    ["<leader>fw"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- Find
    ["<leader>ff"] = { "<cmd> Telescope find_files no_ignore=true follow=true <CR>", "[f]ind [f]iles" },
    ["<leader>fa"] = { "<cmd> Telescope find_files no_ignore=true follow=true hidden=true <CR>", "[f]ind [a]ll" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[f]ind [o]oldfiles" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "[f]ind with [g]rep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "[f]ind [b]uffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "[f]ind [h]elp pages" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[f]ind fu[z]zily in current buffer" },

    -- LSP
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[f]ind [s]ymbols" },
    ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "[f]ind [r]eferences" },
    ["<leader>li"] = { "<cmd> Telescope lsp_incoming_calls <CR>", "[l]SP [i]ncoming calls" },
    ["<leader>ld"] = { "<cmd> Telescope diagnostics bufnr=0 <CR>", "[l]SP [d]iagnostics" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "[g]it [c]ommits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "[g]it [s]tatus" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["gd"] = { function() vim.lsp.buf.declaration() end, "[g]o [d]eclaration (LSP)" },
    ["gD"] = { function() vim.lsp.buf.definition() end, "[g]o [D]efinition (LSP)" },
    ["K"] = { function() vim.lsp.buf.hover() end, "Hover (LSP)" },
    ["gi"] = { function() vim.lsp.buf.implementation() end, "[g]o [i]mplementation (LSP)" },
    ["gr"] = { function() vim.lsp.buf.references() end, "[g]o [r]eferences (LSP)" },
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "[l]SP [a]ction" },
    ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "[l]SP [s]ignature help" },
    ["<leader>lt"] = { function() vim.lsp.buf.type_definition() end, "[l]SP definition [t]ype" },
    ["<leader>lr"] = { function() require("nvchad_ui.renamer").open() end, "[l]SP [r]ename" },
    ["<leader>lD"] = { function() vim.diagnostic.open_float({ border = "rounded" }) end, "[l]SP [D]etails (diagnostic)" },
    ["<leader>lp"] = { function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end, "[l]SP [p]revious diagnostic" },
    ["<leader>ln"] = { function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end, "[l]SP [n]ext diagnostic" },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, "[g]it [r]eset hunk" },
    ["<leader>gh"] = { function() require("gitsigns").preview_hunk() end, "[g]it [h]unk preview" },
    ["<leader>gb"] = { function() package.loaded.gitsigns.blame_line() end, "[g]it [b]lame" },
    ["<leader>gt"] = { function() require("gitsigns").toggle_deleted() end, "[g]it [t]oggle deleted" },
  },
}

M.general = {
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },

  n = {
    ["<leader>s"] = { "<cmd> ClangdSwitchSourceHeader <CR>", "[S]witch header/source (clang)" },
    ["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "[l]SP [f]ormat" },
    ["<leader>do"] = { "<cmd> DiffviewOpen <CR>", "[d]iffview [o]pen" },
    ["<leader>dc"] = { "<cmd> DiffviewClose <CR>", "[d]iffview [c]pen" },
  },

  v = {
    ["<leader>y"] = { '"+y', "[Y]ank to system clipboard" },
  },
}

return M
