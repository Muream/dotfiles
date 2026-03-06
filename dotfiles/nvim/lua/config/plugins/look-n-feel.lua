-- vim.pack.add({ "https://github.com/catppuccin/nvim" })
-- require("catppuccin").setup({ flavour = "mocha", no_italic = true, no_bold = true, })
-- vim.cmd.colorscheme("catppuccin")
--
-- vim.pack.add({ "https://github.com/rose-pine/neovim" })
-- require("rose-pine").setup({
--     variant = "auto", -- auto, main, moon, or dawn
--     styles = {
--         bold = false,
--         italic = false,
--         transparency = false,
--     },
-- })
-- vim.cmd.colorscheme("rose-pine")


-- vim.pack.add({
--     "https://github.com/vague-theme/vague.nvim",
-- })
--
-- require("vague").setup({
--     bold = false,
--     italic = false,
-- })
--
-- vim.cmd("colorscheme vague")
--
--
--

vim.pack.add({"https://github.com/rebelot/kanagawa.nvim"})
-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",            -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",         -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd("colorscheme kanagawa")

vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = { enabled = false },
})

vim.pack.add({ "https://github.com/f-person/auto-dark-mode.nvim" })
require('auto-dark-mode').setup({
    update_interval = 500,
})
