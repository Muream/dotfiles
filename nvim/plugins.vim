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
Plug 'junegunn/fzf'                                                     " fuzzy file search and more
Plug 'junegunn/fzf.vim'                                                 " fuzzy file search and more
Plug 'w0rp/ale'                                                         " async linting
Plug 'tpope/vim-surround'                                               " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                             " comment stuff out
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}  " file drawer

" VISUAL
Plug 'joshdick/onedark.vim'                                             " one dark color scheme

call plug#end()


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
