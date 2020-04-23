local layer = {}

local plug = require("config.plug")

function layer.register_plugins()
    plug.add_plugin("rakr/vim-one")                     -- one dark color scheme
    plug.add_plugin("vim-airline/vim-airline")          -- Sweet looking status line
    plug.add_plugin("vim-airline/vim-airline-themes")   -- Sweet looking status line
end

function layer.init_config()
    vim.o.termguicolors = true

    vim.api.nvim_command("colorscheme one")
    vim.o.background = "dark"

    -- vim.g.airline.extensions.tabline.enabled = 1
    vim.g.airline_powerline_fonts = 1
    vim.g.airline_theme='one'
    vim.g.airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    vim.g.airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

    -- visual comfort
    vim.o.number = true                     -- numers relative to the current line
    vim.o.relativenumber = true             -- current line number is the real number, not 0
    vim.o.cursorline = true                 -- highlight current line

    vim.o.list = true
    vim.o.listchars = "tab:│ ,eol: ,trail:·"

end

return layer
