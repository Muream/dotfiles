local plug  =  require("core.plug")
-- local keybind  =  require("core.keybind")
local edit_mode  =  require("core.edit_mode")

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
    vim.cmd("set tabstop=4")
    vim.cmd("set softtabstop=4")
    vim.cmd("set shiftwidth=4")
    vim.cmd("set expandtab")
    vim.cmd("set autoindent")
    vim.cmd("set smartindent")

    -- searchset ing
    vim.cmd("set ignorecase")                   -- case insensitive search
    vim.cmd("set smartcase")                    -- case sensitive when using capital letters
    vim.cmd("set inccommand=nosplit")           -- in buffer substitute preview

    -- split set directions
    vim.cmd("set splitbelow")
    vim.cmd("set splitright")

    -- misc
    vim.cmd("set clipboard+=unnamedplus")
    vim.cmd("set nowrap")                         -- don't wrap long lines
    vim.cmd("set swapfile")                     -- don't create swap files
    vim.cmd("set autoread")                     -- reload files on change
    vim.cmd("set hidden")                       -- don't lose changes when switching buffers
    vim.cmd("set mouse=a")                      -- enable mouse support
end
return layer
