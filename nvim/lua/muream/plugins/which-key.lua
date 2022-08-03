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
    wk.register({
        ["<leader>"] = {
            f = { "<cmd>Telescope find_files<cr>", " Files Picker" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", " Symbols Picker" },
            S = { "<cmd>Telescope lsp_workspace_symbols<cr>", " Workspace Symbols Picker" },
            b = { "<cmd>Telescope buffers<cr>", " Buffers Picker" },
            v = { require("muream.utils.reload").reload_config, "Reload config" },
        }
    })
end

return M
