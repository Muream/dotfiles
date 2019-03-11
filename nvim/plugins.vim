" auto install vim plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    echo 'Fetching plug.vim...'
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" UTILS
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'ervandew/supertab'                                                " Perform insert mode completions with Tab
Plug 'w0rp/ale'                                                         " async linting

Plug 'tpope/vim-surround'                                               " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                             " comment stuff out
Plug 'tpope/vim-repeat'                                                 " dot commands for stuff like surround, comment, etc
Plug 'tpope/vim-fugitive'                                               " git wrapper
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}  " file drawer
Plug 'Raimondi/delimitMate'                                             " automatically close {[()]}
Plug 'tmhedberg/SimpylFold'                                             " no BS python code folding
Plug 'majutsushi/tagbar'                                                " An outliner for all the tags/symbols in the file
Plug 'tpope/vim-eunuch'                                                 " UNIX shell commands wrapper
Plug 'sheerun/vim-polyglot'                                             " A collection of language packs for Vim
Plug 'nelstrom/vim-visual-star-search'                                  " Search visual selection with *
Plug 'wellle/targets.vim'                                               " Moar text objects

Plug 'junegunn/fzf'                                                     " fuzzy file search and more
Plug 'junegunn/fzf.vim'                                                 " fuzzy file search and more

Plug 'airblade/vim-gitgutter'

" VISUAL
Plug 'vim-airline/vim-airline'                                          " fancy status bar
Plug 'vim-airline/vim-airline-themes'                                   " themes for airline
Plug 'joshdick/onedark.vim'                                             " one dark color scheme
Plug 'Yggdroot/indentLine'                                              " indent guides
Plug 'junegunn/goyo.vim'                                                " distraction free writing
Plug 'junegunn/limelight.vim'                                           " highlight only the current paragraph
Plug 'airblade/vim-gitgutter'

call plug#end()

" ale
let g:ale_sign_column_always=1
let g:ale_lint_on_text_changed='always'
let b:ale_linters=['pylint']

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable='▷'
let NERDTreeDirArrowCollapsible='▼'

" indent line
let g:indentLine_char='│'
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" gitgutter
set updatetime=10

"LSP
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ }
