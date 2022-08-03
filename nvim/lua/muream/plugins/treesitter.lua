M = {}


M.requires = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "nvim-treesitter/playground"
}

M.run = ":TSUpdate"

M.setup = function()
    require("nvim-treesitter.configs").setup {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                }
            }
        },
    }
end

return M
