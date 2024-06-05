return {
  -- list of plugin specifications (lists are tables)
  -- it is either a string or a table which includes package name and configurations
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
}
