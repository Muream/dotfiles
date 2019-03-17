let mapleader = ","
let maplocalleader = "\\"
nnoremap ; :
inoremap jk <esc>l
tnoremap <esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
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

nnoremap <C-.> :bnext<CR>
nnoremap <C-,> :bprev<CR>

"source vimrc
nnoremap <leader>v :so $MYVIMRC<CR>

" fzf mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader><leader>t :Tags<CR>
nnoremap <C-p> :Files<CR>

" NERDTree
nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

