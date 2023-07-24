return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                    "[F]ind [F]iles" },
        { "<leader>fr", "<cmd>Telescope lsp_references<cr>",                "[F]ind [R]eferences" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>",                   "[F]ind [D]iagnostics" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",                     "[F]ind [G]rep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",                       "[F]ind [B]uffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",                     "[F]ind [H]elp Tags" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",          "[F]ind document [s]ymbols" },
        { "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "[F]ind workspace [S]ymbols" },
    },
}
