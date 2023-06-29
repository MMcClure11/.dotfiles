local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

local function set_add(set, item)
  if not vim.tbl_contains(set, item) then
    table.insert(set, item)
  end
end

local function get_def_node(node)
  local target_type = "do_block"

  if node:type() == target_type then
    return node
  end

  local parent = node:parent()
  while parent:type() ~= target_type do
    node = parent
    parent = node:parent()
  end

  return node:parent()
end

local function capture_replace(text)
  local pattern = "socket%.assigns%.([%a%d_]*)"

  local captures = {}
  while string.match(text, pattern) ~= nil do
    local capture = string.match(text, "socket%.assigns%.([%a%d_]*)")
    text = string.gsub(text, "socket.assigns." .. capture, capture)
    set_add(captures, capture)
  end

  return text, captures
end

local function append_assigns_match(start_row, assigns)
  local indent = ""
  for _ = 1, vim.fn.indent(start_row + 1), 1 do
    indent = indent .. " "
  end

  local kvs = {}
  for _, a in ipairs(assigns) do
    table.insert(kvs, string.format("%s: %s", a, a))
  end
  local code = string.format("%%{%s} = socket.assigns", vim.fn.join(kvs, ", "))

  vim.fn.append(start_row, indent .. code)
  vim.fn.append(start_row + 1, "")
end

M.ex_refactor_socket_assigns = function()
  local current_node = ts_utils.get_node_at_cursor()
  local node = get_def_node(current_node)

  local start_row, _, end_row, _ = node:range()
  start_row = start_row + 1

  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, true)
  local changes = {}
  local assigns = {}

  for _, line in ipairs(lines) do
    local updated, captures = capture_replace(line)
    table.insert(changes, updated)
    for _, c in ipairs(captures) do
      set_add(assigns, c)
    end
  end

  vim.api.nvim_buf_set_lines(0, start_row, end_row, true, changes)
  append_assigns_match(start_row, assigns)
end

return M
