return {
  -- for our lsp setup, we can specify and make it have a dependency (such as mason)
  -- we have our own personal dependencies, lsp will work without them, but my lsp config needs them to work
  'neovim/nvim-lspconfig',
  -- a lot of plugin have a setup function that is required for it to be called by Lazy.nvim
  -- mason needs one of those
  -- to install you can use the Mason gui and click on what you want to install
  -- but we want to automate it for use with other computers!
  -- automatic_installation -> if I am setting up a server with lsp config, it will ensure that server is installed when nvim starts
  dependencies = {
    { 'williamboman/mason.nvim',           opts = {} },
    { 'williamboman/mason-lspconfig.nvim', opts = { automatic_installation = true } },
  },
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.elixirls.setup {
      -- run this to start the server, in my shell I can run this, and that is all nvim needs to know.
      -- the default is not given for elixir-ls so we have to specify it
      cmd = { 'elixir-ls' }
    }
  end
}
