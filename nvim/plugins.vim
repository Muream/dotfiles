call plug#begin()
" autocompletion
" Plug 'davidhalter/jedi-vim'                                   " jedi autocompletion for python
Plug 'ervandew/supertab'                                        " tab for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " async auto-completion
Plug 'zchee/deoplete-jedi'                                      " jedi backend for deoplete

" utils
Plug 'kien/ctrlp.vim'                                           " fuzzy file search
Plug 'tpope/vim-surround'                                       " surround anything with anything
Plug 'tpope/vim-commentary'                                     " comment stuff like a boss
Plug 'tpope/vim-obsession'                                      " auto update session files
Plug 'dhruvasagar/vim-prosession'                               " easy switching betwin sessions and mode
Plug 'raimondi/delimitmate'                                     " automatically close quotes, brackets, etc
" Plug 'neomake/neomake'                                          " asynchronous linting
Plug 'w0rp/ale'                                                 " asynchronous linting
Plug 'Chiel92/vim-autoformat'                                   " format code
Plug 'tmhedberg/SimpylFold'                                     " no bs python folding
Plug 'craigemery/vim-autotag'                                   " auto-generate tags

" pretty stuff
Plug 'vim-python/python-syntax'                                 " advanced python syntax highlighting
Plug 'Yggdroot/indentLine'                                      " indent guides
Plug 'vim-airline/vim-airline'                                " nice looking statusbar
Plug 'vim-airline/vim-airline-themes'                         " themes for airline

" colorschemes
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

call plug#end()
" airline
set laststatus=2                                                " airline always visible
set noshowmode                                                  " shows mode only in airline
let g:airline#extensions#tabline#enabled = 1                    " enable the tabline
let g:airline#extensions#tabline#show_buffers = 1               " make sure the buffers are displayed
let g:airline#extensions#tabline#tab_nr_type = 1                " display the number of the tab instead of the number of splits it contains
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''

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
" let g:python_version_3=1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = 'C:/Program Files/Autodesk/Maya2016/bin/mayapy.exe'
" let g:deoplete#sources#jedi#extra_path = ['D:/PERSONAL/mayaDevKit2016/pymel/extras/completion/py']

" neomake
" autocmd! BufWritePost * Neomake

" ale
let g:ale_linters = {
\   'python': ['flake8']
\}

" AutoFormat
let g:formatdef_autopep8 = "'autopep8 - --ignore E501'"
let g:formatters_python = ['autopep8']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_space = 0

" Autotags
let g:autotagExcludeSuffixes = ['docs']

" ProSession
 let g:prosession_dir = '~/AppData/Local/nvim/sessions/'
