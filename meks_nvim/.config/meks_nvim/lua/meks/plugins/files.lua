return {
  {
    -- tag tells it which vs to use, because nvim plugins don’t have versioning management yet
    -- it could even be a commit hash, or branch syntax
    -- branch = '0.1.x',
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff',      '<cmd>Telescope find_files<cr>', desc = 'open file finder with Telescope' },
      { '<leader>fg',      '<cmd>Telescope live_grep<cr>',  desc = 'grep files with Telescope' },
      { '<leader><space>', '<cmd>Telescope buffers<cr>',    desc = 'open buffers with Telescope' }
    }
  }
}
