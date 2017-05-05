call plug#begin()
" autocompletion
Plug 'davidhalter/jedi-vim'                                     " jedi autocompletion for python
Plug 'ervandew/supertab'                                        " tab for autocompletion

" utils
Plug 'kien/ctrlp.vim'                                           " fuzzy file search
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'                                       " surround anything with anything
Plug 'tpope/vim-commentary'                                     " comment stuff like a boss
Plug 'raimondi/delimitmate'                                     " automatically close quotes, brackets, etc
Plug 'xolox/vim-session'                                        " session management
Plug 'xolox/vim-misc'                                           " needed by vim-session
Plug 'neomake/neomake'                                          " asynchronous linting
Plug 'mhinz/vim-signify'                                        " svn change gutter
Plug 'tell-k/vim-autopep8'                                      " format python code
Plug 'majutsushi/tagbar'                                        " show tags on a sidebar
Plug 'tmhedberg/SimpylFold'                                     " no bs python folding

" pretty stuff
Plug 'chriskempson/base16-vim'                                  " colorschemes
Plug 'vim-python/python-syntax'                                 " advanced python syntax highlighting
Plug 'Yggdroot/indentLine'                                      " indent guides
Plug 'ihacklog/HiCursorWords'                                   " highlight instances of current word
Plug 'vim-airline/vim-airline'                                  " cool status line
Plug 'vim-airline/vim-airline-themes'                           " airline themes
Plug 'gcmt/taboo.vim'                                           " rename tabs

call plug#end()

" airline
set laststatus=2                                                " airline always visible
set noshowmode                                                  " shows mode only in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#taboo#enabled = 1

" taboo
let g:taboo_tabline = 0
let g:taboo_renamed_tab_format = "%l"

" vim session
let g:session_directory = "~/Appdata/Local/nvim/sessions"       " save session files directory
let g:session_autoload= "yes"                                   " automatically load latest session
let g:session_autosave = "yes"                                  " automatially save session
set sessionoptions+=tabpages,globals                            " save the tab names in the session

" supertab
let g:SuperTabLongestHighlight= 1                               " select first item of the autocompletion
let g:SuperTabCrMapping = 1                                     " validate completion with <CR>
let g:SuperTabClosePreviewOnPopupClose = 1                      " close preview when completion is done
let g:SuperTabDefaultCompletionType = "<c-n>"                   " supertab goes forward!

" ctrlp
let g:ctrlp_working_path_mode = 0                               " don't go looking for files outside of the current directory

" signify
let g:signify_vcs_list = ['svn']
let g:signify_realtime = 1

" python syntax
let python_highlight_all=1
let g:python_version_2=1

" neomake
autocmd! BufWritePost * Neomake

" HiCursorWords
let g:HiCursorWords_delay = 0
