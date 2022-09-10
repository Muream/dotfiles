M = {}

M.setup = function()
    require("nvim-tree").setup()

    vim.keymap.set("n", "<leader>ft", "<cmd>NvimTreeFindFileToggle<cr>", { noremap = true, desc = "Toggle File Tree" })
end

return M
