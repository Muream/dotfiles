-- Enum for vim modes.

local mode = {}

-- Normal mode
mode.NORMAL = "n"

-- Visual mode
mode.VISUAL = "x"

-- Select mode
mode.SELECT = "s"

-- Not a real mode, just for the vmap/vnoremap commands
mode.VISUAL_SELECT = "v"

-- Insert mode
mode.INSERT = "i"

-- Command mode
mode.COMMAND = "c"

-- Operator pending mode
mode.OPERATOR_PENDING = "o"

-- Terminal mode
mode.TERMINAL = "t"

return mode
