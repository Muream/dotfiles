local mode = require("muream.utils.mode")

M = {}


M.requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
}

M.setup = function()
    vim.keymap.set(
        "n",
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        { noremap = true, desc = "Files" }
    )
    vim.keymap.set(
        "n",
        "<leader>fs",
        "<cmd>Telescope lsp_document_symbols<cr>",
        { noremap = true, desc = "Symbols (Document)" }
    )
    vim.keymap.set(
        "n",
        "<leader>fS",
        "<cmd>Telescope lsp_workspace_symbols<cr>",
        { noremap = true, desc = "Symbols (Workspace)" }
    )
    vim.keymap.set(
        "n",
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        { noremap = true, desc = "Buffers" }
    )
end

return M
