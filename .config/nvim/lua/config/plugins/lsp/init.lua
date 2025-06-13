local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "folke/neodev.nvim",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
}

function M.config()
  local servers = {
    bashls = {},
    lexical = {},
    lua_ls = {
      Lua = {
        telemetry = { enable = false },
        workspace = { checkThirdParty = false },
      },
    },
    ts_ls = {},  -- TypeScript/JavaScript language server
    eslint = {}, -- ESLint for linting
  }

  require("neodev").setup({})
  require("mason").setup()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
  })
end

return M
