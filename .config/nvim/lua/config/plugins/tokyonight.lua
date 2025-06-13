local M = { "folke/tokyonight.nvim" }

function M.config()
  require("tokyonight").setup({
    style = "night",
  })

  -- Sets the default colorscheme
  vim.cmd.colorscheme("tokyonight")
end

return M
