local M = {}

M.setup = function()
    local saga = require("lspsaga")

    saga.init_lsp_saga({
        code_action_lightbulb = {
            sign = false
        }
    })

end

return M
