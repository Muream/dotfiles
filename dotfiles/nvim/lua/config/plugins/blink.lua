vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    "https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    completion = {
        documentation = { auto_show = true },
    },
    signature = {
        enabled = true,
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
})
