vim.pack.add({ "https://github.com/catppuccin/nvim" })
require("catppuccin").setup({ flavour = "mocha", no_italic = true, no_bold = true, })
vim.cmd.colorscheme("catppuccin")

vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = { enabled = false },
})

-- return {
--     {
--         "nvim-zh/colorful-winsep.nvim",
--         config = true,
--         event = { "WinLeave" },
--         opts = {
--             smooth = false,
--         }
--     },
--     {
--         "f-person/auto-dark-mode.nvim",
--         opts = {},
--     },
--     {
--         "catppuccin/nvim",
--         name = "catppuccin",
--         priority = 1000,
--         config = function()
--             require("catppuccin").setup({
--                 flavour = "mocha",
--                 no_italic = true,
--                 no_bold = true,
--             })
--             vim.cmd.colorscheme("catppuccin")
--         end,
--     },
--     {
--         "lewis6991/gitsigns.nvim",
--         dependencies = { "nvim-lua/plenary.nvim" },
--         config = true,
--     },
--     {
--         "norcalli/nvim-colorizer.lua",
--         config = function()
--             require("colorizer").setup()
--         end,
--     },
-- }
