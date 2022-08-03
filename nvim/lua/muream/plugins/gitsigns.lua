M = {}

M.requires = {
    "nvim-lua/plenary.nvim",
}

M.setup = function()
    require("gitsigns").setup {
        -- current_line_blame = true,
        -- current_line_blame_opts = { delay = 0 },
        -- current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    }
end

return M
