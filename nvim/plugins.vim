" Automatically install vim-plug if it's not
if has('win32')
    if empty(glob('C:/Users/muream/AppData/Local/nvim/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo C:/Users/muream/AppData/Local/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif


" vim-plug plugins
call plug#begin()
    " Completion
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }

    " Tim Pope stuff
    Plug 'tpope/vim-surround'                                               " quoting/parenthesizing made simple
    Plug 'tpope/vim-commentary'                                             " comment stuff out
    Plug 'tpope/vim-repeat'                                                 " dot commands for stuff like surround, comment, etc
    Plug 'tpope/vim-fugitive'                                               " git wrapper

    " File accessing
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}  " file drawer
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " fuzzy file search and more
    Plug 'junegunn/fzf.vim'                                                 " fzf integration for vim/neovim

    " Editing goodness
    Plug 'Raimondi/delimitMate'                                             " automatically close {[()]}
    Plug 'tmhedberg/SimpylFold'                                             " no BS python code folding
    Plug 'nelstrom/vim-visual-star-search'                                  " Search visual selection with *
    Plug 'wellle/targets.vim'                                               " Moar text objects

    " MISC
    Plug 'majutsushi/tagbar'                                                " An outliner for all the tags/symbols in the file
    Plug 'airblade/vim-gitgutter'                                           " Git diff in the gutter

    " Languages
    Plug 'sheerun/vim-polyglot'                                             " A collection of language packs for Vim
    Plug 'plasticboy/vim-markdown'
    Plug 'Guzzii/python-syntax'                                             " better syntax highlight for python

    " VISUAL
    Plug 'rakr/vim-one'                                                     " one dark color scheme
    Plug 'Yggdroot/indentLine'                                              " indent guides
    Plug 'vim-airline/vim-airline'                                          " Status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'                                           " Glyphs for various plugins
call plug#end()


" #### airline ####
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" #### indent line ####
let g:indentLine_char='│'
let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0


" #### python-syntax ####
let python_highlight_all = 1
let python_version_2 = 1

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
