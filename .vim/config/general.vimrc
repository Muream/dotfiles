" General
set encoding=utf-8

" Colors
colorscheme Tomorrow-Night 	            " ColorScheme
syntax enable 		    	            " enable syntax processing

" Spaces and tabs
set tabstop=4 		    	            " number of visual spaces per Tab
set softtabstop=4 	    	            " number of spaces in tab when editing
set expandtab		    	            " tabs are spaces

" UI Config
set number                              " show line number
set cursorline                          " highlight current line
set showmatch                           " highlight matching [{()}]
set showcmd                             " show command in bottom bar
set wildmenu                            " visual autocomplete for command menu
filetype indent on                      " load filetype-specific indent files
set lazyredraw                          " redraw only when we need to

" Searching
set incsearch                           " search as characters are entered

" Folding
set foldenable                          " enable folding
set foldmethod=indent                   " fold based on indent level
let g:SimpylFold_docstring_preview=1    " see the docstring of the folded code

