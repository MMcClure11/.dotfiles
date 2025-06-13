-- can be meks.keymaps, makes it look more module like
-- can chain it (put normal commands into a normal module, and have the keymaps
-- module require that mod)
require("meks/keymaps")

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

-- copied verbatim from the github instructions
-- that path is `/Users/mmcclure/.local/share/meks_nvim`
-- if the path is not there, clone it and make it.
-- if it is there, great, move on.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- a list of places on my computer where nvim will look for files that it needs to run
-- rtp = real time path
-- nvim is cloning from github to this path
-- so when you say require telescope, it will check your personal files, then it will go look elsewhere if it doesn’t find it
-- the lazypath is the first thing in the list, so it will probably find the plugins first before the personal modules
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  "meks/plugins",
  -- turn off notification every time the nvim config is updated
  { change_detection = { notify = false } }
)

vim.keymap.set('n', '<leader>c', function()
  local user_opt = vim.fn.inputlist({ 'select color scheme: ',
    '1. tokyonight-night', '2. catppuccin', '3. kanagawa-wave', '4. kanagawa-dragon', '5. kanagawa-lotus'
  })

  if user_opt == 1 then
    vim.cmd([[colorscheme tokyonight-night]])
  elseif user_opt == 2 then
    vim.cmd.colorscheme "catppuccin"
  elseif user_opt == 3 then
    vim.cmd("colorscheme kanagawa-wave")
  elseif user_opt == 4 then
    vim.cmd("colorscheme kanagawa-dragon")
  elseif user_opt == 5 then
    vim.cmd("colorscheme kanagawa-lotus")
  end
end, { desc = 'switch color schemes' })

-- Temporary hack for when heex files don’t sort Tailwind.
vim.api.nvim_create_user_command("TailwindHack", function()
  local file_type = vim.bo.filetype
  vim.cmd([[set ft=html]])
  vim.cmd([[TailwindSort]])
  vim.cmd([[set ft=]] .. file_type)
end, {})

-- allow copy/pasting in and out of nvim using the system clipboard
vim.opt.clipboard = 'unnamedplus'

-- auto commands (ie, when an event happens, do this thing, like formatting on save)
-- there is a special event called text yank post
-- Autocommands
-- take two args, both are tables
-- the first is a table list with the name of the event
-- the second is a table map with key value pairs
-- 	the pattern is required, we use star here since we want it to always be called
-- 	then the callback is what we want to happen as a result of the 'TextYankPost
-- 	optionally add a description, so you can see what all autocommands you have that are active.
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "highlights yanked text"
})
