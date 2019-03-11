set termguicolors
colorscheme onedark

set relativenumber          " numbers relative to the current line
set number                  " current line number is the real line number (not 0)
set cursorline              " highlight current line
set noshowmode

" display invisible characters (tabs, trailing spaces, etc
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" searching
set ignorecase              " case insensitive search
set smartcase               " case sensitive when using capital letters
set inccommand=nosplit      " in buffer substitute preview

" tabs and spaces
filetype plugin indent on
set tabstop=4               " number of visual spaces per tab (tab length)
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " insert spaces with tab
set shiftwidth=4            " when indenting with '>', use 4 spaces width

" splits
set splitbelow              " horizontal splits are created at the bottom
set splitright              " vertical splits are created on the right

" misc
set clipboard+=unnamedplus      " use system clipboard
set noswapfile              " don't create swap files
set autoread                " reload files on change
set hidden                  " don't lose changes when switching buffers
set nowrap                  " don't wrap long lines
set linebreak               " don't cut in the middle of a word wen wrapping

set foldlevel=99            " everything is unfolded by default

set diffopt+=vertical       " vertical diff, used for git fugitive
