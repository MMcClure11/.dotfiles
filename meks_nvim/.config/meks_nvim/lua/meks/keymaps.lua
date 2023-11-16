-- my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- source the current buffer
-- n for normal mode (ni is normal & insert mode)
-- can use ' or "
-- `:` will work most of the time, but 3% of the time it won’t. “<cmd>” is the same and should always work.
-- cr = carriage return (enter)
-- vim.keymap.set('n', '<leader>s', '<cmd>source %<cr>', {desc = 'source the current buffer'})
-- write a lua function when the third arg becomes more complex
vim.keymap.set('n', '<leader>s', function()
  vim.cmd('source %')
  print('sourced buffer')
end, { desc = 'source the current buffer' })

-- Keybindings to move between windows with arrow keys
vim.keymap.set('n', '<Right>', '<c-w>l', { desc = 'move cursor one window to right'}) 
vim.keymap.set('n', '<Left>', '<c-w>h', { desc = 'move cursor one window to left'}) 
vim.keymap.set('n', '<Up>', '<c-w>k', { desc = 'move cursor up one window'}) 
vim.keymap.set('n', '<Down>', '<c-w>j', { desc = 'move cursor down one window'}) 

-- Turn off search (/) highlighting with escape key
vim.keymap.set('n', '<c-[>', '<cmd>nohl<cr>', { desc = 'turn off search highlighting with esc'})

-- Ask for opt name, will go look it up, then print it out
vim.keymap.set('n', '<leader>o', function()
  local user_opt = vim.fn.input('enter opt name: ')
  print(vim.opt[user_opt]:get())
end, { desc = 'takes an arg for an opt, looks it up, and prints its current value' })

