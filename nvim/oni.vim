" General {{{
    set modelines=1
    " set foldmethod=marker
    set relativenumber                  " numbers relative to the current line
    set number                          " current line number is the real line number (not 0)
    set cursorline                      " highlight current line
    set noshowmode                      " don't show the current mode, let the status bar do it
    set autoread                        " reload file when they are modified
    au FocusGained * :checktime         " reload buffer when focused, autoread wasn't enough
    " set foldlevel=99                     " everything is unfolded by default

    set nowrap                          " lines don't wrap
    set incsearch                       " search as we type
    set ignorecase                      " case insensitive searching
    set smartcase                       " case sensitive if caps in search
    set inccommand=nosplit
    set clipboard=unnamed
    set list
    set listchars=space:·,tab:→\ 
" }}}
" Mappings {{{
    let mapleader = ","

    " jk instead of <esc>
    inoremap jk <esc>l
    inoremap jK <esc>l
    inoremap Jk <esc>l
    inoremap JK <esc>l

    " stop highlighting search when pressing escape
    nnoremap <esc> :nohls<CR>

    " move in wrapped line as expected
    nnoremap j gj
    nnoremap k gk

    " Center screen when going to the end of the file
    nnoremap G Gzz

    " fold with space
    nnoremap <space> za

    " don't deselect text when indenting
    vnoremap > >gv
    vnoremap < <gv

    " Navigating buffers"
    nnoremap <C-.> :bnext<CR>
    nnoremap <C-,> :bprev<CR>
" }}}
" Plugins {{{
    if has('win32')
        call plug#begin('~/AppData/Roaming/Oni/plugins')
    else
        call plug#begin('~/.config/oni/plugins')
    endif
    Plug 'vim-scripts/colorizer'                        " color the background of well... colors
    Plug 'tpope/vim-fugitive'                           " A git wrapper so amazing it should be illegal
    Plug 'tpope/vim-rhubarb'                            " :Gbrowse works with github
    Plug 'airblade/vim-gitgutter'                       " show git 'diff' in the gutter
    Plug 'editorconfig/editorconfig-vim'
    Plug 'Muream/oni-afterglow'
    call plug#end()
" }}}
" vim:foldmethod=marker:foldlevel=0
