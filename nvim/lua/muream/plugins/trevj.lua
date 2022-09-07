M = {}

M.setup = function()
    vim.keymap.set("n", "S", require('trevj').format_at_cursor, { noremap = true, desc = "Split Lines" })
end

return M
