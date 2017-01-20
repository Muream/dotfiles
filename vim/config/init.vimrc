" On Windows, also use '.vim' instead of 'vimfiles'; this makes
" synchronization across (heterogeneous) systems easier.
if has('win32')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

call plug#begin()

Plug 'scrooloose/nerdtree'                  " file manager
Plug 'kien/ctrlp.vim'                       " fuzzy file search
Plug 'bling/vim-airline'                    " cool status line
Plug 'vim-airline/vim-airline-themes'       " themes for airline
Plug 'flazz/vim-colorschemes'               " lots of colorschemes

Plug 'klen/python-mode'                     " python goodness, including better highlighting
Plug 'tmhedberg/SimpylFold'                 " better python folding
Plug 'davidhalter/jedi-vim'                 " jedi autocompletion for python
Plug 'ervandew/supertab'                    " use tab to autocomplete anytime

Plug 'tpope/vim-fugitive'                   " git stuff inside vim

Plug 'scrooloose/nerdcommenter'             " easily comment stuff
Plug 'tpope/vim-surround'                   " surround text
Plug 'yggdroot/indentline'                  " show indent guides
Plug 'raimondi/delimitmate'                 " Automatically closes quotes, parenthesis, etc.

Plug 'xolox/vim-session'                    " extended session management
Plug 'xolox/vim-misc'                       " needed by vim session

Plug 'Scrooloose/syntastic'                 " highlight errors
Plug 'airblade/vim-gitgutter'               " git diff in gutter

" OS specific plugins
if has('unix')
	Plug 'christoomey/vim-tmux-navigator'       " seamless navigation between vim splits and tmux
endif

call plug#end()
