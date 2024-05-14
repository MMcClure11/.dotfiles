return {
  {
    -- tag tells it which vs to use, because nvim plugins don’t have versioning management yet
    -- it could even be a commit hash, or branch syntax
    -- branch = '0.1.x',
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require("telescope")
      local global_mappings = {
        i = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
        },
      }
      telescope.setup({
        pickers = {
          find_files = {
            mappings = global_mappings,
          },
          live_grep = {
            mappings = global_mappings,
          },
        },
      })
    end,

    keys = {
      { '<leader>ff',      '<cmd>Telescope find_files<cr>', desc = 'open file finder with Telescope' },
      { '<leader>fg',      '<cmd>Telescope live_grep<cr>',  desc = 'grep files with Telescope' },
      { '<leader><space>', '<cmd>Telescope buffers<cr>',    desc = 'open buffers with Telescope' }
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      source_selector = {
        winbar = true,
      }
    },
    keys = {
      {
        '<leader>ee',
        '<cmd>Neotree action=focus source=filesystem position=left toggle=true reveal=true<cr>',
        desc =
        'toggle explorer'
      },
      {
        '<leader>ef',
        '<cmd>Neotree reveal_file=%<cr>',
        desc =
        'open explorer to current file'
      }
    }
  }
}
