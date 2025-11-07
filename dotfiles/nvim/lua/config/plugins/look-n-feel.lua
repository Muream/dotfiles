-- vim.pack.add({ "https://github.com/catppuccin/nvim" })
-- require("catppuccin").setup({ flavour = "mocha", no_italic = true, no_bold = true, })
-- vim.cmd.colorscheme("catppuccin")

vim.pack.add({ "https://github.com/rose-pine/neovim" })
require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },
})
vim.cmd.colorscheme("rose-pine")

vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = { enabled = false },
})

vim.pack.add({ "https://github.com/f-person/auto-dark-mode.nvim" })
require('auto-dark-mode').setup()
