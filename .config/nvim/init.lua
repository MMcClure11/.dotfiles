-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

-- Load core config
require("config.abbrevs")
require("config.commands")
require("config.keymaps")
require("config.options")

-- Load plugin manager
require("lazy").setup("config.plugins", {
  checker = {
    enabled = false
  },
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "tokyonight-night" },
  },
})

-- This is a lua file, have to tell it that we are running vimscript
local quotes = { 'Nick is da best mentor.', 'Yury is hilarious, cares a lot, and has got your back.',
  'Jordan says, You can do hard things.', 'You are enough',
  'Be the weirdest, strangest, most unhinged part of someone’s day.' }
local quote = quotes[math.random(#quotes)]
vim.g.mcm_test_line = quote
vim.cmd([[nnoremap <leader>tn <cmd>exe "let g:mcm_test_line = expand('%') . '\:' . line('.') <bar> !mix test " . mcm_test_line <cr>]])
vim.cmd([[nnoremap <leader>tt <cmd>exe "!mix test " . mcm_test_line <cr>]])
