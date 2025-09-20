vim.pack.add({"https://github.com/kylechui/nvim-surround"})
require("nvim-surround").setup({})

vim.pack.add({ "https://github.com/Wansmer/treesj" })
require('treesj').setup({ use_default_keymap=false })
vim.keymap.set("n", "<leader>s", require("treesj").toggle)
require("config.plugins.tree-sitter")



-- return {
--     {
--         'nmac427/guess-indent.nvim',
--         config = function()
--             require('guess-indent').setup {}
--         end,
--     },
--     {
--         "kylechui/nvim-surround",
--         version = "*", -- Use for stability; omit to use `main` branch for the latest features
--         event = "VeryLazy",
--         config = function()
--             require("nvim-surround").setup({
--                 -- Configuration here, or leave empty to use defaults
--             })
--         end,
--     },
--     {
--         "numToStr/Comment.nvim",
--         config = function()
--             require("Comment").setup({
--                 -- ignores empty lines
--                 ignore = "^$",
--             })
--         end,
--     },
-- }
