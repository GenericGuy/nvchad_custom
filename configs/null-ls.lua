local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
-- format-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Note: run MasonInstallAll to install them ^^
local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.clang_format,
  formatting.cmake_format,
  lint.shellcheck,
  lint.cmake_lint,
}

null_ls.setup({
  debug = true,
  sources = sources,
  -- format-on-save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ async = false }) end,
      })
    end
  end,
})
