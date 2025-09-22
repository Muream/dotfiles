vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    -- "https://github.com/nvim-treesitter/playground",
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },

    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
            },
        },
    },
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle nvim-treesitter updates",
    group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            vim.notify("nvim-treesitter updated, running TSUpdate.", vim.log.levels.INFO)
            local ok = pcall(vim.cmd, "TSUpdate")
            if ok then
                vim.notify("TSUpdate completed successfully", vim.log.levels.INFO)
            else
                vim.notify("TSUpdate command could not run", vim.log.levels.WARN)
            end
        end
    end
})
