let mapleader=","               " leader is comma

"jk instead of escape
inoremap jk <esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
nnoremap <space> za

"source ~/.vimrc
nnoremap <leader>so :so ~/.vimrc<CR>

" NERDTree
noremap <leader>ne :NERDTreeToggle<CR>
