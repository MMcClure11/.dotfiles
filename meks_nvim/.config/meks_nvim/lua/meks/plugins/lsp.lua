return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.elixirls.setup {
      cmd = {'/Users/mmcclure/.local/share/nvim/mason/bin/elixir-ls'}
    }
  end
}
