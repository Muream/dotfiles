return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = {
            enabled = true,
            animate = { enabled = false },
        },
        input = { enabled = true },
        picker = { enabled = true },
        -- notifier = { enabled = true },
        quickfile = { enabled = true },
        -- scope = { enabled = true },
        -- scroll = { enabled = true },
        statuscolumn = { enabled = true },
        -- words = { enabled = true },
        styles = {
            indent = {
                animate = { enabled = false },
            },
            input = {
                relative = "cursor",
                row = -3,
                col = 0,
            }
        }
    },

    keys = {
        { "<leader>ft", function() require("snacks").explorer.reveal() end, desc = "Explorer" },
        { "<leader>ff", function() require("snacks").picker.files() end,    desc = "[F]ind [F]iles" },
        { "<leader>fg", function() require("snacks").picker.grep() end,     "[F]ind [G]rep" },
        { "<leader>fb", function() require("snacks").picker.buffers() end,  "[F]ind [B]uffers" },
    },
}
