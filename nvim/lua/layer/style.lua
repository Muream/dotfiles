local layer = {}

local plug = require("core.plug")

    function layer.register_plugins()
    plug.add_plugin("rakr/vim-one")                     -- one dark color scheme
    plug.add_plugin("vim-airline/vim-airline")          -- Sweet looking status line
    plug.add_plugin("vim-airline/vim-airline-themes")   -- Sweet looking status line
    plug.add_plugin("Yggdroot/indentLine")
    plug.add_plugin("lukas-reineke/indent-blankline.nvim")
end

function layer.init_config()
    vim.cmd("set termguicolors")

    vim.cmd("colorscheme one")
    vim.cmd("set background=dark")

    -- vim.g.airline.extensions.tabline.enabled = 1
    vim.g.airline_powerline_fonts = 1
    vim.g.airline_theme='one'
    vim.g.airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    vim.g.airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

    -- visual comfort
    vim.cmd("set number")-- numbers relative to the current line
    vim.cmd("set relativenumber")             -- current line number is the real number, not 0
    vim.cmd("set cursorline")                 -- highlight current line


    vim.g.indentLine_char = "▏"
    vim.g.indentLine_faster = 1

    vim.cmd("set list")
    vim.cmd("set listchars=tab:→\\ ,eol:¬,space:⋅,trail:·,extends:❯,precedes:❮")
    vim.g.indent_blank_line_space_char = true
    vim.g.indent_blankline_extra_indent_level = -1
end

return layer
