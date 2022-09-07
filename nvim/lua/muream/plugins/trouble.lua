M = {}

M.requires = {
    'kyazdani42/nvim-web-devicons'
}

M.setup = function()
    require("trouble").setup({
        auto_preview = false,
    })

    vim.keymap.set("n", "<leader>dt", "<cmd>TroubleToggle<cr>", { noremap = true, desc = "Toggle Diagnostics" })
end

return M
