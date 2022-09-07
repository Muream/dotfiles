M = {}

M.setup = function()
    local wk = require("which-key")

    -- Config
    wk.setup({
        window = {
            border = "single"
        },
    })

    -- Keymap
    --- Let's only register groups here
    --- Mappings are defined within each plugin config and should provide a description.
    wk.register({
        ["<leader>"] = {
            f = { "Find" },
            d = { "Diagnostics" },
            g = { "Go!" },
            t = { "Tree" },
        }
    })
end

return M
