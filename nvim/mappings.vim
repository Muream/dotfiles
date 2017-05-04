let mapleader = ","
inoremap jk <esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nmap <C-Tab> gt
nmap <C-S-Tab> gT

" file navigation
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap <space> za

nnoremap <leader>w :w<cr>

" tags navigation
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader><leader>t :TagbarOpen fjc<CR>

nnoremap <silent><leader><leader>f :NERDTree<CR>
