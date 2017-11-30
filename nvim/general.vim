set termguicolors
colorscheme onedark

set relativenumber          " numbers relative to the current line
set number                  " current line number is the real line number (not 0)
set cursorline              " highlight current line

" display invisible characters (tabs, trailing spaces, etc
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" searching
set ignorecase              " case insensitive search
set smartcase               " case sensitive when using capital letters

" tabs and spaces
set tabstop=4               " number of visual spaces per tab (tab length)
" set softtabstop=4             " number of spaces in tab when editing
set expandtab               " insert spaces with tab

" splits
set splitbelow              " horizontal splits are created at the bottom
set splitright              " vertical splits are created on the right

" misc
set clipboard+=unnamed      " use system clipboard
set noswapfile              " don't create swap files
set autoread                " reload file when they are modified
set hidden
set nowrap
