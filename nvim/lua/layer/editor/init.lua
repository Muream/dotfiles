local plug  =  require("config.plug")
-- local keybind  =  require("config.keybind")
local edit_mode  =  require("config.edit_mode")

local layer  =  {}

function layer.register_plugins()
    plug.add_plugin("sheerun/vim-polyglot")     -- A bunch of languages
    plug.add_plugin("tpope/vim-surround")       -- Awesome for dealing with surrounding things, like parens
    plug.add_plugin("tpope/vim-repeat")         -- dot commands for stuff like surround, comment, etc
    plug.add_plugin("tpope/vim-commentary")     -- comment stuff out
end


function layer.init_config()


    --- Key Bindings
    -- set leader
    vim.g.mapleader  =  " "
    -- <esc> remaps
    vim.api.nvim_set_keymap(edit_mode.INSERT, "jk", "<esc>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.TERMINAL, "jk", "<C-\\><C-n>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.TERMINAL, "<esc>", "<C-\\><C-n>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<esc>", ":nohls<CR>", { noremap  =  true }) -- disable highlighting with <esc>

    -- buffer navigation
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "H", "^", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.VISUAL_SELECT, "H", "^", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "L", "$", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.VISUAL_SELECT, "L", "$", { noremap  =  true })

    vim.api.nvim_set_keymap(edit_mode.NORMAL, "j", "gj", { noremap  =  true }) -- navigate wrapped lines
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "k", "gk", { noremap  =  true }) -- navigate wrapped lines
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "G", "Gzz", { noremap  =  true }) -- center cursor when going to the end of the file

    --  Split Navigation
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-H>", "<C-W><C-H>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-J>", "<C-W><C-J>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-K>", "<C-W><C-K>", { noremap  =  true })
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<C-L>", "<C-W><C-L>", { noremap  =  true })

    -- source init.vim
    vim.api.nvim_set_keymap(edit_mode.NORMAL, "<leader>v", ":so $MYVIMRC<CR>", { noremap  =  true })

    --- General settings
    -- Default indentation rules
    vim.o.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.autoindent = true
    vim.o.smartindent = true

    -- searching
    vim.o.ignorecase = true                 -- case insensitive search
    vim.o.smartcase = true                  -- case sensitive when using capital letters
    vim.o.inccommand = "nosplit"            -- in buffer substitute preview

    -- split directions
    vim.o.splitbelow = true
    vim.o.splitright = true

    -- misc
    vim.o.clipboard = "unnamedplus"
    vim.o.wrap = false                      -- don't wrap long lines
    vim.o.swapfile = false                  -- don't create swap files
    vim.o.autoread = true                   -- reload files on change
    vim.o.hidden = true                     -- don't lose changes when switching buffers
    vim.o.mouse = "a"                       -- enable mouse support
end

return layer
