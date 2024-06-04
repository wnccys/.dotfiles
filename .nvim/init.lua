-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.clipboard = "unnamedplus"
vim.cmd("colorscheme kanagawa-wave")

-- Function to check and show long LSP messages
function Show_long_lsp_message()
  local current_line = vim.fn.line(".")
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(0, current_line - 1)

  for _, diagnostic in ipairs(diagnostics) do
    local screen_width = vim.o.columns
    if diagnostic.message and #diagnostic.message > screen_width then
      -- Show the message in a floating window
      vim.lsp.util.open_floating_preview({ diagnostic.message }, "plaintext")
      return
    end
  end
  print("No long messages on the current line.")
end

-- Keymap to trigger the custom handler
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua show_long_lsp_message()<CR>", { noremap = true, silent = true })
