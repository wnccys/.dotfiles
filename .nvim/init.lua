-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.clipboard = "unnamedplus"
vim.cmd("colorscheme kanagawa-dragon")

local function show_all_lsp_messages()
  local current_line = vim.fn.line(".") - 1
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(0, current_line)

  if #diagnostics == 0 then
    print("No diagnostics for the current line.")
    return
  end

  local messages = {}
  for _, diagnostic in ipairs(diagnostics) do
    table.insert(messages, diagnostic.message)
  end

  -- Show the messages in a floating window
  vim.lsp.util.open_floating_preview(messages, "plaintext")
end

-- Make the function global
_G.show_all_lsp_messages = show_all_lsp_messages

-- Keymap to trigger the custom handler
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua show_all_lsp_messages()<CR>", { noremap = true, silent = true })
