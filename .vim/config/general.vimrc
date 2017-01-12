" General
set encoding=utf-8

" GUI
if has("gui_running")
  set guioptions-=m                     " remove menu bar
  set guioptions-=T                     " remove toolbar
  set guioptions-=r                     " remove right-hand scroll bar
  set guioptions-=L                     " remove left-hand scroll bar
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

" Colors
syntax enable                           " enable syntax highlighting
colorscheme Tomorrow-Night              " colorscheme... obviously

" Interface
set number				                " show line numbers
set relativenumber		                " use relative line numbers
set cursorline			                " hightlight current line
set showmatch			                " highlight matchin [{()}]
set showcmd				                " show command in bottom bar
set wildmenu			                " visual autocomplete for command menu
" set lazyredraw			            " redraw only when we need to
filetype indent on		                " load filetype-specific indent files


" Spaces and tabs
set tabstop=4 		    	                " number of visual spaces per Tab
set softtabstop=4 	    	              " number of spaces in tab when editing
set expandtab		    	                  " tabs are spaces

" Searching
set incsearch			                " search as charaters are entered

" Folding
set foldenable                          " enable folding
set foldlevelstart=99                   " open all folds by default
set foldmethod=indent                   " fold based on indent level
let g:SimplyFold_docstring_preview=1
