return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        { "s1n7ax/nvim-window-picker", opts = {} },
    },
    opts = {
        -- source_selector = {
        --     winbar = true,
        -- },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_hidden = true,
                never_show = { "__pycache__" },
            },
        },
        window = {
            width = 35,
        },

        default_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                folder_empty_open = "",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon",
            },

            git_status = {
                symbols = {
                    -- Change type
                    added = "✚", -- NOTE: you can set any of these to an empty string to not show them
                    deleted = "✖",
                    modified = "",
                    renamed = "󰁕",
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "󰄱",
                    staged = "",
                    conflict = "",
                },
                align = "right",
            },
        },
    },
}
