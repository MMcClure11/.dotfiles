return {
  { "voldikss/vim-floaterm", keys = {
    { "<Leader>g", "<cmd>FloatermNew --width=0.9 --height=0.9 lazygit<cr>", desc = "Open lazygit in Floaterm" }
  } },

  -- Editing
  "tpope/vim-surround",
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = {
      on_save_enabled = true,
      on_save_pattern = { "*.heex", "*.ex" }
    },
  },

  -- Navigation
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  { "folke/trouble.nvim", config = true },

  -- Syntax
  "sheerun/vim-polyglot",

  -- Source Control
  { "lewis6991/gitsigns.nvim",
    config = {
      current_line_blame = true,
    }
  },
  "tpope/vim-fugitive",

  -- Miscellaneous
  { "NvChad/nvim-colorizer.lua", config = true },
  "tpope/vim-repeat",
  "tpope/vim-rsi",
  "tpope/vim-unimpaired",
}
