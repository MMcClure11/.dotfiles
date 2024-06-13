return {
  -- always use the latest main branch version
  -- adds `gc` and `gcc`
  { "echasnovski/mini.comment",    version = false, config = true },
  { "echasnovski/mini.statusline", version = false, config = true },
  -- leap
  -- :map s
  -- :map <s-s> (how to check shift key)
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').create_default_mappings()
    end
  },
}
