return {
  -- this could be blank if I decide to move these to a “colors” file
  -- even if empty, this is a good place to test plugins before committing to
  -- adding them to the config
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- double [[]] is another way to make a string
      -- vim.cmd("colorscheme tokyonight")
      vim.cmd([[colorscheme tokyonight-night]])
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "rebelot/kanagawa.nvim"
  },
  -- on demand syntax highlighting
  'sheerun/vim-polyglot'
}
