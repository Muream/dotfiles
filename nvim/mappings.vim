let mapleader = ","
let maplocalleader = "\\"
nnoremap ; :
inoremap jk <esc>l
inoremap j<S-k> <esc>l
nnoremap <esc> :nohls<CR>

"split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" file navigation
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap <space> za

"source vimrc
nnoremap <leader>v :so $MYVIMRC<CR>

" fzf mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader><leader>t :Tags<CR>
nnoremap <C-p> :Files<CR>

nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

