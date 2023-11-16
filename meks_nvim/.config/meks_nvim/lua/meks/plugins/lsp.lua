-- to run anything outside a return function, it has to become before it otherwise lua will be hella mad
-- print you can see with `:messages` (because it was not the last message)
-- vim.api.nvim_create_autocmd("BufWritePre",
--  { group = vim.api.nvim_create_augroup('tommy', {}), callback = function() print(
--   "I want strawberries and peanut butter.") end })

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
    -- this is for setting up the lua lsp for use with nvim, it requires a lot of extra setup because it is being run inside nvim, this dependency does that for us
    { 'folke/neodev.nvim',                 opts = {} }
  },
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.elixirls.setup {
      -- run this to start the server, in my shell I can run this, and that is all nvim needs to know.
      -- the default is not given for elixir-ls so we have to specify it
      cmd = { 'elixir-ls' }
    }

    --  these two have defaults that include the correct name with `-language-server`
    --  so we don’t need to specify anything extra
    lspconfig.tsserver.setup {}
    lspconfig.sqlls.setup {}
    lspconfig.lua_ls.setup {}

    -- KEYBINDINGS
    -- we don’t want to activate the keybinding unless the language server is attached to the buffer
    -- keys option that Lazy.nvim option gives us, the plugin won’t load until we press the key combos
    -- but here, we want the lsps to load as soon as a buffer opens that it can attach to
    -- AUTOCOMMANDS
    -- general vim concept
    -- you can attach behaviors to events
    -- good idea to put auto cmds inside autocmd groups so they don’t get duplicated
    vim.api.nvim_create_autocmd("LspAttach",
      {
        group = vim.api.nvim_create_augroup('tommy', {}),
        callback = function(event)
          -- IO.inspect converts map into a string that can be printed. vim.print does the same type of thing
          -- we have a buf key in the event table
          -- vim.print(event)
          vim.keymap.set("n", "<localleader>s", "<cmd>Telescope lsp_document_symbols<cr>",
            { desc = "list document symbols (things like function heads, test names, etc.", buffer = event.buf }
          )

          -- this should be working, it maybe doesn’t work for short diagnostic strings. Come back to it, check if working with bigger errors
          vim.keymap.set("n", "<localleader>d", vim.diagnostic.open_float,
            { desc = "open float with diagnostic description", buffer = event.buf }
          )
        end
      })
  end
}
