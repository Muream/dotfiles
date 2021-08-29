local edit_mode = require("utils.edit_mode")

-- Leader Key
vim.g.mapleader  =  " "

-- <esc> remaps
vim.api.nvim_set_keymap(edit_mode.INSERT, "jk", "<Esc>l", {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<esc>", "<cmd>nohls<CR>", {noremap = true})

-- buffer navigation
vim.api.nvim_set_keymap(edit_mode.NORMAL, "H", "^", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.VISUAL_SELECT, "H", "^", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "L", "$", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.VISUAL_SELECT, "L", "$", { noremap  =  true })

--  Split Navigation
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-H>", "<C-W><C-H>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-J>", "<C-W><C-J>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-K>", "<C-W><C-K>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-L>", "<C-W><C-L>", { noremap  =  true })

-- source init files
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>v", ":so $MYVIMRC<CR>", { noremap  =  true })

-- LSP
vim.api.nvim_set_keymap(edit_mode.NORMAL, "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true})
vim.api.nvim_set_keymap(edit_mode.NORMAL, '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})

-- Telescope
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap  =  true })
vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap  =  true })

