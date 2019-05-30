if has('win32')
    if empty(glob('C:/Users/muream/AppData/Local/nvim/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo C:/Users/muream/AppData/Local/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif


call plug#begin()

" UTILS
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-surround'                                               " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                             " comment stuff out
Plug 'tpope/vim-repeat'                                                 " dot commands for stuff like surround, comment, etc
Plug 'tpope/vim-fugitive'                                               " git wrapper
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmhedberg/SimpylFold'                                             " no BS python code folding
Plug 'majutsushi/tagbar'                                                " An outliner for all the tags/symbols in the file
Plug 'tpope/vim-eunuch'                                                 " UNIX shell commands wrapper
Plug 'sheerun/vim-polyglot'                                             " A collection of language packs for Vim
Plug 'nelstrom/vim-visual-star-search'                                  " Search visual selection with *
Plug 'wellle/targets.vim'                                               " Moar text objects

Plug 'junegunn/fzf'                                                     " fuzzy file search and more
Plug 'junegunn/fzf.vim'                                                 " fuzzy file search and more
Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'

" VISUAL
Plug 'Guzzii/python-syntax'
Plug 'joshdick/onedark.vim'                                             " one dark color scheme
Plug 'Yggdroot/indentLine'                                              " indent guides
Plug 'vim-airline/vim-airline'                                          " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'                                           " highlight only the current paragraph
Plug 'junegunn/goyo.vim'                                                " distraction free writing
Plug 'ryanoasis/vim-devicons'                                           " Glyphs for various plugins

call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" indent line
let g:indentLine_char='│'
let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" python-syntax
let python_highlight_all = 1
let python_version_2 = 1

" fzf
" close the fzf split when cancelling the search
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
