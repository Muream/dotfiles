local mode = require("utils.mode")

-- Leader Key
vim.g.mapleader  =  " "

-- <esc>
vim.api.nvim_set_keymap(mode.INSERT, "jk", "<Esc>l", {noremap = true})
vim.api.nvim_set_keymap(mode.NORMAL, "<esc>", "<cmd>nohls<CR>", {noremap = true})

-- Editing
vim.api.nvim_set_keymap(mode.INSERT, "<C-BS>", "<C-W>", {noremap = true})
vim.api.nvim_set_keymap(mode.VISUAL, "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap(mode.VISUAL, ">", ">gv", {noremap = true})

-- Wrapped Lines Navigation
vim.api.nvim_set_keymap(mode.NORMAL, "j", "gj", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "k", "gk", { noremap  =  true })

-- Buffer navigation
vim.api.nvim_set_keymap(mode.NORMAL, "H", "^", { noremap  =  true })
vim.api.nvim_set_keymap(mode.VISUAL_SELECT, "H", "^", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "L", "$", { noremap  =  true })
vim.api.nvim_set_keymap(mode.VISUAL_SELECT, "L", "$", { noremap  =  true })

--  Split Navigation
vim.api.nvim_set_keymap(mode.NORMAL, "<C-H>", "<C-W><C-H>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<C-J>", "<C-W><C-J>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<C-K>", "<C-W><C-K>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<C-L>", "<C-W><C-L>", { noremap  =  true })

-- Telescope
vim.api.nvim_set_keymap(mode.NORMAL, "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(mode.NORMAL, "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap  =  true })

