let mapleader = "\<space>"
inoremap jk <esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" navigate buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" file navigation
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap <leader>f za

nnoremap <leader>w :w<CR>

" tags navigation
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader><leader>t :TagbarOpen fjc<CR>

nnoremap <silent><leader><leader>f :NERDTree<CR>

nnoremap <leader>r :so $MYVIMRC<CR>
