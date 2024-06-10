return {
  -- list of plugin specifications (lists are tables)
  -- it is either a string or a table which includes package name and configurations
  {
    'lewis6991/gitsigns.nvim',
    -- not strictly necessary for me since I have which key installed elsewhere
    -- but it allows me to use it as a one off, or pass along the config to others
    dependencies = { 'folke/which-key.nvim' },
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup()
      local keymaps = {
        -- with 'which-key', you can nest key mappings
        ['<leader>g'] = {
          b = { gitsigns.toggle_current_line_blame, 'toggle current line git blame' },
          p = { gitsigns.preview_hunk, 'show mini git diff (preview hunk)' },
          r = { gitsigns.reset_hunk, 'reset git diff to previous version' },
          d = { gitsigns.toggle_deleted, 'reveals previously deleted code from git diff' }
        },
        -- useful when reviewing code
        [']h'] = { gitsigns.next_hunk, 'jump to next hunk' },
        ['[h'] = { gitsigns.prev_hunk, 'jump to previous hunk' },
      }
      require('which-key').register(keymaps)
    end
  }
}
