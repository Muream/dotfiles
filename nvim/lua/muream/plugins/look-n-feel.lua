return {
    {
        "RRethy/nvim-base16",
        config = function()
            require("base16-colorscheme").setup({
                base00 = "#151515", base01 = "#242424", base02 = "#383838", base03 = "#969896",
                base04 = "#b4b7b4", base05 = "#c5c8c6", base06 = "#e0e0e0", base07 = "#ffffff",
                base08 = "#cc6666", base09 = "#de935f", base0A = "#f0c674", base0B = "#b5bd68",
                base0C = "#8abeb7", base0D = "#81a2be", base0E = "#b294bb", base0F = "#a3685a"
            })
            vim.cmd.highlight("VertSplit guifg=#383838")
        end,
    },

    "lukas-reineke/indent-blankline.nvim",
    {
        "lukas-reineke/virt-column.nvim",
        config=function()
            require("virt-column").setup({ char = "│" })
            vim.cmd.highlight("VirtColumn guifg=#383838 gui=nocombine")
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config=function()
            require("gitsigns").setup()
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },

    {
        "romgrk/barbar.nvim",

        keys = {
            {"<A-p>", "<cmd>BufferNext<cr>"},
            {"<A-n>", "<cmd>BufferPrevious<cr>"},
        },
        config = true,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
}
