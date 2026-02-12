-- Leader Key
vim.g.mapleader = " "

-- <esc>
vim.keymap.set("i", "jk", "<Esc>l", { noremap = true })
vim.keymap.set("n", "<esc>", "<cmd>nohls<CR>", { noremap = true })
vim.keymap.set("n", "¬", "~", { noremap = true })

-- Wrapped Lines Navigation
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Maintain search words in the center of the buffer
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- center the cursor when going to the end of the buffer
vim.keymap.set("n", "G", "Gzz")

-- Maintain cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

--  Split Navigation
vim.keymap.set("n", "<C-h>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-W><C-L>", { noremap = true })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
-- vim.keymap.set("i", "<C-Space>", "<C-x><C-o>") -- Ctrl Space to trigger autocomplete
-- vim.keymap.set("i", "<Tab>", "<C-Y>")          -- Tab to confirm completion
-- vim.keymap.set("n", 'gr', function() Snacks.picker.lsp_references() end)
-- vim.keymap.set("n", 'gi', function() Snacks.picker.builtin.lsp_implementations() end)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

-- vim.keymap.set("n", '<leader>fs', function() Snacks.picker.lsp_symbols() end)
-- vim.keymap.set("n", '<leader>fS', function() Snacks.picker.lsp_workspace_symbols() end)

vim.keymap.set("n", "<leader>bb", ":make<CR>")
