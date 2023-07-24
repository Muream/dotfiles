return {
    {
        "kylechui/nvim-surround",
        version = "*",     -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                -- ignores empty lines
                ignore = '^$'
            })
        end
    },

    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({ --[[ your config ]] })
        end,
    }
}
