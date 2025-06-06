------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

set("n", "<Left>", "<C-w>h")
set("n", "<Down>", "<C-w>j")
set("n", "<Up>", "<C-w>k")
set("n", "<Right>", "<C-w>l")

set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

set("n", "<Leader>p", "<Cmd>Lazy<CR>", { desc = "Plugins" })

set("n", "<LocalLeader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

set("n", "<LocalLeader>s", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
  { desc = "Document symbols" })
