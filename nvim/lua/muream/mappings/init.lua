local mode = require("muream.utils.mode")

-- Leader Key
vim.g.mapleader = " "

-- <esc>
vim.keymap.set(mode.INSERT, "jk", "<Esc>l", { noremap = true })
vim.keymap.set(mode.NORMAL, "<esc>", "<cmd>nohls<CR>", { noremap = true })

-- Editing
vim.keymap.set(mode.INSERT, "<C-BS>", "<C-W>", { noremap = true })
vim.keymap.set(mode.VISUAL, "<", "<gv", { noremap = true })
vim.keymap.set(mode.VISUAL, ">", ">gv", { noremap = true })

-- Wrapped Lines Navigation
vim.keymap.set(mode.NORMAL, "j", "gj", { noremap = true })
vim.keymap.set(mode.NORMAL, "k", "gk", { noremap = true })

--  Split Navigation
vim.keymap.set(mode.NORMAL, "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set(mode.NORMAL, "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set(mode.NORMAL, "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set(mode.NORMAL, "<C-L>", "<C-W><C-L>", { noremap = true })


vim.keymap.set(
    mode.NORMAL,
    "<leader>vv",
    require("muream.utils.reload").reload_config,
    { noremap = true, desc = "Reload Config" }
)
