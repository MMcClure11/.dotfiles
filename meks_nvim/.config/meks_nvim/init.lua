-- opt is a “map” with a key cursorline
-- you can “inspect” via the command line `:= vim.opt`
-- when inspecting, it's helpful to get the value of the opt: `:= vim.opt.cursorline:get()`
-- also `:help cursorline`
vim.opt.cursorline = false

-- INDENTATION
-- default tab is 8 spaces
-- we have 3 opts we need to adjust to fix this
-- make the variable local, variables are global by default in lua
-- local will bind it to this file (the lua module)
local indent = 2
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.tabstop = indent

-- weird things will happen without this. What? It is a mystery. You don’t want to know.
vim.opt.expandtab = true

-- when you press <cr> it will smartly indent you if you are in a block.
vim.opt.smartindent = true

-- SPLITS
-- default it will bring the new window above for horizonal splits. New window
-- goes to the left for vertical splits. Well that’s wrong. Fix it.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- line numbers
vim.opt.number = true

-- GLOBAL STATUS LINE
vim.opt.laststatus = 3

-- COLORS
-- this says my terminal emulator (kitty) can display the full range of colors
vim.opt.termguicolors = true

-- UPDATETIME
-- Default is 4000, this is the delay time for 2 triggers
-- 1. by default vim will by default will create a backup file. If something crashes it will try to recover (swap files). It will create these more frequently.
-- 2. 'cursorhold' this is an auto command. Can be used by different plugins to do things like highlight the text you are hovering over.
-- Something that would be cool to do, hover over an error and have the menu display the full error. This timeout would govern how long you have to hover to trigger that action.
-- Will make the editor feel a little snappier in some situations
vim.opt.updatetime = 1000

-- SEARCH
-- INC COMMAND
-- Incremental command
-- Default is 'nosplit', 'split' shows all the found instances in a popup window.
vim.opt.inccommand = 'split'
-- default for `/` is case sensitive
-- makes searches case insensitive
vim.opt.ignorecase = true
-- if any part of the search is uppercase, turn on case sensitivity for the search
vim.opt.smartcase = true
-- grep program, default is grep
-- rg is the faster more modern version of grep
-- tells rg to output the results in a format that the quickfix list can understand.
vim.opt.grepprg = 'rg --vimgrep'

-- KEY MAPS

-- my leader key
vim.g.mapleader = ' '

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

