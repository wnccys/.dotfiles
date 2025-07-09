require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })
map("n", "<leader>a", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })
map("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Show code actions" })
map({"i", "n"}, "<C-Space>", "<cmd>lua cmp.mapping.complete()<CR>")
map("n", "<leader>mbn", "<cmd>lua require('nvchad.tabufline').move_buf(1)<CR>", { desc = "Move buffer forward by 1", silent = true, noremap = true } )
map("n", "<leader>mbp", "<cmd>lua require('nvchad.tabufline').move_buf(-1)<CR>", { desc = "Move buffer backward by 1", silent = true, noremap = true } )


-- vim.lsp.buf.hover()

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
