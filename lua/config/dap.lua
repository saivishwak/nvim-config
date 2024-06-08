local dap = require("dap")
local dapui = require("dapui")
local mason = require("mason")
local mason_dap = require("mason-nvim-dap")

-- Initialize mason
mason.setup()

-- Setup dap UI
dapui.setup()

-- Setup dap-virtual-text
require("nvim-dap-virtual-text").setup()

-- Ensure required debuggers are installed
-- mason_dap.setup({
--   ensure_installed = { "codelldb" }, -- Adjust the debugger name if necessary
--   automatic_installation = true,
-- })
--
-- nvim-dap configuration for Rust using codelldb
-- dap.adapters.codelldb = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Adjust the path if necessary
--     args = { "--port", "${port}" },
--   },
-- }
--
-- dap.configurations.rust = {
--   {
--     name = "Launch",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     args = {},
--   },
-- }

-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     args = {},
--   },
-- }

-- Keybindings for debugging
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>b",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>B",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lp",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>",
  { noremap = true, silent = true }
)
