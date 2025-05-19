return {
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
    end,
    keys = {
      { "<Leader>g", "<cmd>FloatermNew lazygit<cr>", desc = "Open lazygit in Floaterm" }
    }
  },

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
    -- Remove trailing white space on save
    {
      "mcauley-penney/tidy.nvim",
      config = {
        filetype_exclude = { "markdown", "diff" }
      },
      init = function()
        vim.keymap.set('n', "<leader>te", require("tidy").toggle, {})
      end
    }
  },

  -- Navigation
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  { "folke/trouble.nvim",        config = true },

  -- Syntax
  "sheerun/vim-polyglot",

  -- Source Control
  {
    "lewis6991/gitsigns.nvim",
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

  -- Trying it out!
  "tpope/vim-projectionist",

  {
    "stevearc/conform.nvim",
    opts = { format_on_save = { lsp_format = "fallback" } }
  },

  -- Fidget
  { "j-hui/fidget.nvim", opts = {} },

  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Trying out AI copilot
  -- { "github/copilot.vim" }
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   opts = {},
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- build is a special key for running a shell command after it runs the plugine command
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
}
