local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "lua_ls", "bashls", "clangd", "cmake", "pyright", "rust_analyzer"}
local cmp_nvim_lsp = require "cmp_nvim_lsp"

for _, lsp in ipairs(servers) do
  if lsp == "clangd" then
    -- This fixes the offset-encoding-error message when clang-format is enabled
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = cmp_nvim_lsp.default_capabilities(),
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

end

