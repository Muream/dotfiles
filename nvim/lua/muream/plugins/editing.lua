return {
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "numToStr/Comment.nvim",
        config= function()
            require("Comment").setup({
                -- ignores empty lines
                ignore = '^$'
            })
        end
    }

}
