" look & feel
set termguicolors
set background=dark
colorscheme NeoSolarized
set number                      " show line numbers
set relativenumber              " use relative line numbers
set cursorline                  " highlight current line
set showcmd                     " show command in botom bar
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching {[()]}
set colorcolumn=80              " highlight 81st column
set so=5

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" searching
set incsearch
set ignorecase                  " case insensitive
set smartcase                   " except if contains capital letter
set inccommand=nosplit

" tabs and spaces
filetype plugin indent on
set tabstop=4                   " number of visual spaces per tab
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces

" splits
set splitbelow                  " horizontal splits are created on the bottom
set splitright                  " vertical splits are created on the far right

" misc
set clipboard=unnamed           " use system clipboard
set noswapfile                  " don't create swapfiles
filetype indent on              " indent based on filetype (?)
set autoread                    " autoreload files

" buffers
set hidden                      " don't lose changes when switching buffers

" folds
" set foldmethod=indent
set foldlevel=99
