call plug#begin()
" autocompletion
Plug 'davidhalter/jedi-vim'                             " jedi autocompletion for python
Plug 'ervandew/supertab'                                " tab for autocompletion

" utils
Plug 'kien/ctrlp.vim'                                   " fuzzy file search 
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'                               " surround anything with anything
Plug 'raimondi/delimitmate'                             " automatically close quotes, brackets, etc
Plug 'xolox/vim-session'                                " session management
Plug 'xolox/vim-misc'                                   " needed by vim-session

" pretty stuff
Plug 'chriskempson/base16-vim'                          " colorschemes
Plug 'Yggdroot/indentLine'                              " indent guides
Plug 'vim-airline/vim-airline'                          " cool status line 
Plug 'vim-airline/vim-airline-themes'                   " airline themes
Plug 'gcmt/taboo.vim'
call plug#end()

" airline
set laststatus=2                                        " airline always visible
set noshowmode                                          " shows mode only in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#taboo#enabled = 1

" taboo
let g:taboo_tabline = 0
let g:taboo_renamed_tab_format = "%l"

" vim session
let g:session_directory = "~/Appdata/Local/nvim/sessions"     " save session files directory
let g:session_autoload= "yes"                           " automatically load latest session
let g:session_autosave = "yes"                          " automatially save session
set sessionoptions+=tabpages,globals                    " save the tab names in the session

" supertab
let g:SuperTabLongestHighlight= 1                       " select first item of the autocompletion
let g:SuperTabCrMapping = 1                             " validate completion with <CR>
let g:SuperTabClosePreviewOnPopupClose = 1              " close preview when completion is done
let g:SuperTabDefaultCompletionType = "<c-n>"           " supertab goes forward!
