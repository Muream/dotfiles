--- Python layer
-- @module layer.file_man

local plug = require("core.plug")
local keybind = require("core.keybind")
local edit_mode = require("core.edit_mode")

local layer = {}

--- Returns plugins required for this layer
function layer.register_plugins()
    plug.add_plugin("preservim/nerdtree")
    plug.add_plugin('junegunn/fzf') -- fuzzy file search and more
    plug.add_plugin('junegunn/fzf.vim') -- fzf integration for vim/neovim
end

--- Configures vim and plugins for this layer
function layer.init_config()
    -- nerdtree
    keybind.bind_command(edit_mode.NORMAL, "<leader>ff", ":NERDTreeFocus<CR>", { noremap = true })
    keybind.bind_command(edit_mode.NORMAL, "<leader>fm", ":NERDTreeToggle<CR>", { noremap = true })

    -- fzf
    keybind.bind_command(edit_mode.NORMAL, "<leader>b", ":Buffers<CR>,", {noremap = true})
    keybind.bind_command(edit_mode.NORMAL, "<leader>t", ":BTags<CR>", {noremap = true})
    keybind.bind_command(edit_mode.NORMAL, "<leader><leader>t", ":Tags<CR>", {noremap = true})
    keybind.bind_command(edit_mode.NORMAL, "<C-p>", ":Files<CR>", {noremap = true})

    vim.cmd("autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>") -- properly close fzf with <esc>

end

return layer
