return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
        { "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
    },
}
