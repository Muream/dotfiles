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
    },
}
