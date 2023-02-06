-- Leader Key
vim.g.mapleader = " "

-- <esc>
vim.keymap.set("i", "jk", "<Esc>l", { noremap = true })
vim.keymap.set("n", "<esc>", "<cmd>nohls<CR>", { noremap = true })

-- Move selected lines around
vim.keymap.set("v", "H", "<gv", { noremap = true })
vim.keymap.set("v", "L", ">gv", { noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Wrapped Lines Navigation
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Maintain search words in the center of the buffer
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Maintain cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

--  Split Navigation
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })
