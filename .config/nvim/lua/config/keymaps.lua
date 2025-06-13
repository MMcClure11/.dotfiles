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

set('n', '<leader>c', function()
  local user_opt = vim.fn.inputlist({
    'Select color scheme: ',
    '1. tokyonight-night',
    '2. tokyonight-storm',
    '3. catppuccin-mocha',
    '4. catppuccin-latte',
    '5. kanagawa-wave',
    '6. kanagawa-dragon',
    '7. kanagawa-lotus'
  })

  if user_opt == 1 then
    vim.cmd.colorscheme("tokyonight-night")
  elseif user_opt == 2 then
    vim.cmd.colorscheme("tokyonight-storm")
  elseif user_opt == 3 then
    vim.cmd.colorscheme("catppuccin-mocha")
  elseif user_opt == 4 then
    vim.cmd.colorscheme("catppuccin-latte")
  elseif user_opt == 5 then
    vim.cmd.colorscheme("kanagawa-wave")
  elseif user_opt == 6 then
    vim.cmd.colorscheme("kanagawa-dragon")
  elseif user_opt == 7 then
    vim.cmd.colorscheme("kanagawa-lotus")
  end
end, { desc = 'Switch color schemes' })
