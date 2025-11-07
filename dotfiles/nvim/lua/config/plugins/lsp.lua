vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/folke/lazydev.nvim",
})
require("mason").setup()
require("mason-lspconfig").setup()
require("lazydev").setup()

-- All the highlighting is handled with tree sitter
vim.lsp.document_color.enable(false)
