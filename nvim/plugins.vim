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
" Plug 'tell-k/vim-autopep8'                                      " format python code
Plug 'Chiel92/vim-autoformat'                                   " format code
Plug 'majutsushi/tagbar'                                        " show tags on a sidebar
Plug 'tmhedberg/SimpylFold'                                     " no bs python folding
Plug 'jceb/vim-orgmode'                                         " org mode for vim
Plug 'vim-scripts/utl.vim'                                      " links in vim

" pretty stuff
Plug 'chriskempson/base16-vim'                                  " colorschemes
Plug 'vim-python/python-syntax'                                 " advanced python syntax highlighting
Plug 'Yggdroot/indentLine'                                      " indent guides
" Plug 'ihacklog/HiCursorWords'                                   " highlight instances of current word
" Plug 'qstrahl/vim-matchmaker'                                   " highlight instances of current word
Plug 'itchyny/vim-cursorword'                                    " highlight instances of current word
Plug 'vim-airline/vim-airline'                                  " cool status line
Plug 'vim-airline/vim-airline-themes'                           " airline themes
Plug 'gcmt/taboo.vim'                                           " rename tabs
Plug 'junegunn/rainbow_parentheses.vim'                         " color matching parenthesis
Plug 'xolox/vim-colorscheme-switcher'                           " easily switch colorscheme

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
let g:ctrlp_show_hidden = 1

" signify
let g:signify_vcs_list = ['svn']
let g:signify_realtime = 1

" python syntax
let python_highlight_all=1
let g:python_version_2=1

" jedi-vim
let g:jedi#popup_select_first = 1

" neomake
autocmd! BufWritePost * Neomake

" matchmaker
let g:matchmaker_enable_startup = 1

" autopep8
" let g:autopep8_ignore="E501"
" let g:autopep8_disable_show_diff=1

" AutoFormat
let g:formatdef_autopep8 = "'autopep8 - --ignore E501'"
let g:formatters_python = ['autopep8']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_space = 0

" rainbow parenthesis
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" org-mode
let g:org_indent = 1
