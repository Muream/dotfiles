require("bufferline").setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<A-p>", "<cmd>BufferNext<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-n>", "<cmd>BufferPrevious<cr>", opts)
