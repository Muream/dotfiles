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
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}  " file drawer
Plug 'Raimondi/delimitMate'                                             " automatically close {[()]}
Plug 'tmhedberg/SimpylFold'                                             " no BS python code folding
Plug 'ludovicchabant/vim-gutentags'                                     " Easy tag management
Plug 'majutsushi/tagbar'                                                " An outliner for all the tags/symbols in the file

Plug 'junegunn/fzf'                                                     " fuzzy file search and more
Plug 'junegunn/fzf.vim'                                                 " fuzzy file search and more
Plug 'jremmen/vim-ripgrep'                                               " fast search
Plug 'itchyny/lightline.vim'                                            " status line

" VISUAL
Plug 'joshdick/onedark.vim'                                             " one dark color scheme
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'Yggdroot/indentLine'                                              " indent guides
Plug 'ap/vim-buftabline'                                                " buffers listed in the tabline

call plug#end()


" deoplete
let g:deoplete#sources#jedi#extra_path = [
    \"D:/PERSONAL/mayaDevKit2016/pymel/extras/completion/py"
\]

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

" lightline
let g:lightline = {
        \'colorscheme': 'one',
        \}

" indent line
let g:indentLine_char = '│'
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'

" gutentags
let g:gutentags_project_root = ['tags']

" ripgrep
let g:rg_binary = 'D:/PERSONAL/software/ripgrep-0.8.1-x86_64-pc-windows-msvc/rg.exe'
