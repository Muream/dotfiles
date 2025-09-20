local function base64(data)
    data = tostring(data)
    local bit = require("bit")
    local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local b64, len = "", #data
    local rshift, lshift, bor = bit.rshift, bit.lshift, bit.bor

    for i = 1, len, 3 do
        local a, b, c = data:byte(i, i + 2)
        b = b or 0
        c = c or 0

        local buffer = bor(lshift(a, 16), lshift(b, 8), c)
        for j = 0, 3 do
            local index = rshift(buffer, (3 - j) * 6) % 64
            b64 = b64 .. b64chars:sub(index + 1, index + 1)
        end
    end

    local padding = (3 - len % 3) % 3
    b64 = b64:sub(1, -1 - padding) .. ("="):rep(padding)

    return b64
end

local function set_user_var(key, value)
    io.write(string.format("\027]1337;SetUserVar=%s=%s\a", key, base64(value)))
end

vim.pack.add({"https://github.com/numToStr/Navigator.nvim"})

require('Navigator').setup({})

-- Set the IS_NVIM "User Var" in the shell to true to let Navigator know this
-- pane is a neovim pane
set_user_var("IS_NVIM", true)

-- When exiting, set IS_NVIM to back false to let Navigator this
-- pane is no longer a neovim pane
vim.api.nvim_create_autocmd({ "ExitPre" }, { callback = function(ev) set_user_var("IS_NVIM", false) end })

vim.keymap.set("n", "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set("n", "<A-p>", "<CMD>NavigatorPrevious<CR>")
