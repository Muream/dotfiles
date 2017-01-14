let mapleader="\<Space>"                           " leader is comma

"jk instead of escape
inoremap jk <esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resize splits
nmap <silent> + :vertical resize +5<CR>
nmap <silent> - :vertical resize -5<CR>
nmap <silent> <leader>+ :resize +5<CR>
nmap <silent> <leader>- :resize -5<CR>

" Buffers act as tabs
set hidden                                  " Don't lose changes when switching buffers
" navigate buffers
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
"close current buffer
nmap <leader>bq :bp <BAR> bd #<CR>

" Folding
nnoremap <leader><space> za

"source ~/.vimrc
nmap <leader>so :so ~/.vimrc<CR>

" save file
nmap <leader>w :w<CR>

" NERDTree
noremap <leader>ne :NERDTreeToggle<CR>

