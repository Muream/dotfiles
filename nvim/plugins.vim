" Fetch vim-plug if it is not installed.
" Could not use variables in the curl call,
" so made two separate blocks.
if has('win32')
    if empty(glob('C:/Users/muream/AppData/Local/nvim/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo C:/Users/muream/AppData/Local/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin()

" UTILS
" deoplete for either neovim or vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'                                              " deoplete source for jedi 

Plug 'ervandew/supertab'                                                " Perform insert mode completions with Tab
Plug 'w0rp/ale'                                                         " async linting
Plug 'tpope/vim-surround'                                               " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                             " comment stuff out
Plug 'tpope/vim-fugitive'                                               " git wrapper
Plug 'tpope/vim-repeat'                                                 " dot commands for stuff like surround, comment, etc
Plug 'wellle/targets.vim'                                               " moar text objects
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}  " file drawer
Plug 'Raimondi/delimitMate'                                             " automatically close {[()]}
Plug 'tmhedberg/SimpylFold'                                             " no BS python code folding
Plug 'ludovicchabant/vim-gutentags'                                     " Easy tag management

Plug 'junegunn/fzf'                                                     " fuzzy file search and more
Plug 'junegunn/fzf.vim'                                                 " fuzzy file search and more
Plug 'jremmen/vim-ripgrep'                                              " fast search
Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'

" VISUAL
Plug 'joshdick/onedark.vim'                                             " one dark color scheme
Plug 'Yggdroot/indentLine'                                              " indent guides
Plug 'vim-airline/vim-airline'                                          " Status bar
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" ale
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed='always'
let b:ale_linters = ['pylint']

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" indent line
let g:indentLine_char = '│'

" gutentags
let g:gutentags_project_root = ['tags']

" ripgrep
let g:rg_binary = 'C:/ProgramData/chocolatey/lib/ripgrep/tools/rg.exe'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
