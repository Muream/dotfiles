return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        priority = 1000,
        config = function()
            vim.g.moonflyTransparent = true
            vim.cmd.colorscheme("moonfly")
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#444444" })
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#111111" })
            vim.opt.fillchars = vim.opt.fillchars + "eob: " + "vert:▎"
        end
    },

    "lukas-reineke/indent-blankline.nvim",

    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("virt-column").setup({ char = "│" })
            vim.cmd.highlight("VirtColumn guifg=#383838 gui=nocombine")
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
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

        lazy = false,
        keys = {
            { "<A-p>", "<cmd>BufferNext<cr>" },
            { "<A-n>", "<cmd>BufferPrevious<cr>" },
        },
        config = function()
            require("bufferline").setup()
        end,

    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
}
