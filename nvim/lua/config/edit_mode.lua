--- Edit modes
-- @module config.edit_mode

local edit_mode = {}

--- Normal mode
edit_mode.NORMAL = "n"

--- Visual mode
edit_mode.VISUAL = "x"

--- Select mode
edit_mode.SELECT = "s"

--- Not a real mode, just for the vmap/vnoremap commands
edit_mode.VISUAL_SELECT = "v"

--- Insert mode
edit_mode.INSERT = "i"

--- Command mode
edit_mode.COMMAND = "c"

--- Operator pending mode
edit_mode.OPERATOR_PENDING = "o"

--- Terminal mode
edit_mode.TERMINAL = "t"

return edit_mode
