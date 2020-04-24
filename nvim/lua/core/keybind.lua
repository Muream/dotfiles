--- Keybind management
-- @module core.keybind

-- local plug = require("core.plug")
local edit_mode = require("core.edit_mode")

local keybind = {}

keybind._leader_info = {}

function keybind.register_plugins()
end
--- Split a key sequence string like "fed" into { "f", "e", "d" }
local function split_keys(keys)
    local keys_split = {}

    -- TODO: Support <C-f> and <tab> and etc. style syntax
    for c in string.gmatch(keys, ".") do
        table.insert(keys_split, c)
    end

    return keys_split
end

--- Map a key sequence to a Vim command
--
-- @param mode An edit mode from `core.edit_mode`
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
function keybind.bind_command(mode, keys, command, options)
    options = options or {}
    vim.api.nvim_set_keymap(mode, keys, command, options)
end

--- Map a key sequence to a Vim command
--
-- @param mode An edit mode from `core.edit_mode`
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
function keybind.buf_bind_command(mode, keys, command, options)
    options = options or {}
    vim.api.nvim_buf_set_keymap(0, mode, keys, command, options)
end

keybind._bound_funcs = {}

--- Map a key sequence to a Lua function
--
-- @param mode An edit mode from `core.edit_mode`
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam function func The Lua function to bind to the key sequence
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
function keybind.bind_function(mode, keys, func, options)
    options = options or {}
    options.noremap = true

    local func_name = "bind_" .. mode .. "_" .. keys

    local func_name_escaped = func_name
    -- Escape Lua things
    func_name_escaped = func_name_escaped:gsub("'", "\\'")
    func_name_escaped = func_name_escaped:gsub('"', '\\"')
    func_name_escaped = func_name_escaped:gsub("\\[", "\\[")
    func_name_escaped = func_name_escaped:gsub("\\]", "\\]")

    -- Escape VimScript things
    -- We only escape `<` - I couldn't be bothered to deal with how <lt>/<gt> have angle brackets in themselves
    -- And this works well-enough anyways
    func_name_escaped = func_name_escaped:gsub("<", "<lt>")

    keybind._bound_funcs[func_name] = func

    local lua_command = ":lua require('core.keybind')._bound_funcs['" .. func_name_escaped .. "']()<CR>"
    -- Prefix with <C-o> if this is an insert-mode mapping
    if mode == "i" then
        lua_command = "<C-o>" .. lua_command
    end

    vim.api.nvim_set_keymap(mode, keys, lua_command, options)
end

return keybind
