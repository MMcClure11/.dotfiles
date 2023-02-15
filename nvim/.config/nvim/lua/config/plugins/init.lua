return {
  { "voldikss/vim-floaterm", keys = {
    { "<Leader>g", "<cmd>FloatermNew --width=0.9 --height=0.9 lazygit<cr>", desc = "Open lazygit in Floaterm" }
  } },
  -- Editing
  "tpope/vim-surround",
  -- Navigation
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  { "folke/trouble.nvim", config = true },

  -- Syntax
  "sheerun/vim-polyglot",

  -- Source Control
  { "lewis6991/gitsigns.nvim", config = true },
  "tpope/vim-fugitive",

  -- Miscellaneous
  { "NvChad/nvim-colorizer.lua", config = true },
  "tpope/vim-repeat",
  "tpope/vim-rsi",
  "tpope/vim-unimpaired",
}
