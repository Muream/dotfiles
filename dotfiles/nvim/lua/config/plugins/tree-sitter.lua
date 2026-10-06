vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= "" then
            local success = pcall(function()
                vim.treesitter.start()
            end)
            if not success then
                return
            end
        end
    end,
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
