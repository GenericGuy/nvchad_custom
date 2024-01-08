---@type ChadrcConfig

vim.opt.clipboard = ""
vim.opt.scrolloff = 5;

local M = {}
M.ui = require("custom.userinterface")
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
