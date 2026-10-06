vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })

local ai = require('mini.ai')
ai.setup({
    custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
    n_lines = 500,
})
