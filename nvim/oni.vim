" General
set relativenumber                  " numbers relative to the current line
set number                          " current line number is the real line number (not 0)
set cursorline                      " highlight current line
set noshowmode                      " don't show the current mode, let the status bar do it
set autoread                        " reload file when they are modified
au FocusGained * :checktime         " reload buffer when focused, autoread wasn't enough
set foldlevel=99                    " everything is unfolded by default

set nowrap                          " lines don't wrap
set incsearch                       " search as we type
set ignorecase                      " case insensitive searching
set smartcase                       " case sensitive if caps in search
set inccommand=nosplit
set clipboard=unnamed

" Mappings
let mapleader = ","
inoremap jk <esc>l

inoremap jK <esc>l
inoremap Jk <esc>l
inoremap JK <esc>l
nnoremap <esc> :nohls<CR>

nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap <space> za

nnoremap <C-.> :bnext<CR>
nnoremap <C-,> :bprev<CR>

" Plugins
call plug#begin('~/AppData/Roaming/Oni/plugins')
Plug 'tpope/vim-surround'
Plug 'vim-scripts/colorizer'
Plug 'tmhedberg/simpylfold'
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

