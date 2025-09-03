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
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })
