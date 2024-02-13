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
  'sheerun/vim-polyglot',
  -- whichkey
  {
    'folke/which-key.nvim',
    opts = {}
 },
 -- tailwind sorting
 -- temporary work around for heex files
 -- `:set ft=html`
 -- `:TailwindSort`
 -- `:set ft=heex`
 -- for some odd reason, it recognizes html files.
   {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    opts = {
      on_save_enabled = true,
      on_save_pattern = { "*.heex", "*.ex" }
    }
  },
  -- treesitter
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
}
