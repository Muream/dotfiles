call plug#begin()
" autocompletion
" Plug 'davidhalter/jedi-vim'                                   " jedi autocompletion for python
Plug 'ervandew/supertab'                                        " tab for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " async completion
Plug 'zchee/deoplete-jedi'                                      " jedi backend for deoplete


" utils
Plug 'kien/ctrlp.vim'                                           " fuzzy file search
Plug 'tpope/vim-surround'                                       " surround anything with anything
Plug 'tpope/vim-commentary'                                     " comment stuff like a boss
Plug 'raimondi/delimitmate'                                     " automatically close quotes, brackets, etc
Plug 'neomake/neomake'                                          " asynchronous linting
Plug 'Chiel92/vim-autoformat'                                   " format code
Plug 'tmhedberg/SimpylFold'                                     " no bs python folding

" pretty stuff
Plug 'vim-python/python-syntax'                                 " advanced python syntax highlighting
Plug 'Yggdroot/indentLine'                                      " indent guides
" Plug 'vim-airline/vim-airline'                                  " cool status line
" Plug 'vim-airline/vim-airline-themes'                           " airline themes
Plug 'junegunn/rainbow_parentheses.vim'                         " color matching parenthesis

" colorschemes
Plug 'iCyMind/NeoSolarized'

call plug#end()

" " airline
" set laststatus=2                                                " airline always visible
" set noshowmode                                                  " shows mode only in airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline#extensions#taboo#enabled = 1
" let g:airline_powerline_fonts = 1

" supertab
let g:SuperTabLongestHighlight= 1                               " select first item of the autocompletion
let g:SuperTabCrMapping = 1                                     " validate completion with <CR>
let g:SuperTabClosePreviewOnPopupClose = 1                      " close preview when completion is done
let g:SuperTabDefaultCompletionType = "<c-n>"                   " supertab goes forward!

" ctrlp
let g:ctrlp_working_path_mode = 0                               " don't go looking for files outside of the current directory
let g:ctrlp_show_hidden = 1

" python syntax
let python_highlight_all=1
let g:python_version_3=1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" neomake
autocmd! BufWritePost * Neomake

" AutoFormat
let g:formatdef_autopep8 = "'autopep8 - --ignore E501'"
let g:formatters_python = ['autopep8']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_space = 0

