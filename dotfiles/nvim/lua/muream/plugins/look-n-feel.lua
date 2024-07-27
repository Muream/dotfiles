return {
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinLeave" },
        opts = {
            smooth = false,
        }
    },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
            end,
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                no_italic = true,
                no_bold = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { enabled = false },
        },
    },

    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("virt-column").setup({ char = "│" })
            vim.cmd.highlight("VirtColumn guifg=#383838 gui=nocombine")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
}
