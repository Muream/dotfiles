" General
set encoding=utf-8
set autoread

" GUI
if has("gui_running")
  set guioptions-=m                     " remove menu bar
  set guioptions-=T                     " remove toolbar
  set guioptions-=r                     " remove right-hand scroll bar
  set guioptions-=L                     " remove left-hand scroll bar

  " Change the font of the gvim
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
let python_highlight_all=1
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set t_Co=256

" Interface
" hi Normal ctermbg=none
set number                              " show line numbers
set relativenumber                      " use relative line numbers
set cursorline                          " hightlight current line
set showmatch                           " highlight matchin [{()}]
set showcmd                             " show command in bottom bar
set wildmenu                            " visual autocomplete for command menu
" set lazyredraw                        " redraw only when we need to
filetype indent on                      " load filetype-specific indent files
" toggle invisible characters

" Searching
set incsearch                           " search as charaters are entered
set ignorecase                          " case insensitive searching
set smartcase                           "case-sensitive if search contains a capital letter

" Spaces and tabs
set tabstop=4                           " number of visual spaces per tab
set softtabstop=4                       " number of spaces in tab when editing
set expandtab                           " tabs are spaces

" Folding
set foldenable                          " enable folding
set foldlevelstart=99                   " open all folds by default
set foldmethod=indent                   " fold based on indent level
let g:SimplyFold_docstring_preview=1

" splits
set splitbelow
set splitright

" Better Copy & Paste
set pastetoggle=<F2>                    " proper intentation when pasting from outside of vim
set clipboard=unnamed                   " uses system clipboard

set noswapfile

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
