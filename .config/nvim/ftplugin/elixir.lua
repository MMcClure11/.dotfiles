vim.api.nvim_buf_create_user_command(0, "ExRefactorSocketAssigns", function()
  require("config.util").ex_refactor_socket_assigns()
end, {})
