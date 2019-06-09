set termguicolors
colorscheme onedark
set background=dark

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
set shiftwidth=4            " when indenting with >
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

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

" fix the terminal colors. This matches the onedark theme
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
