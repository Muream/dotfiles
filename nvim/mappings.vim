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
nnoremap <S-H> ^
" nnoremap <S-J> 5j
" nnoremap <S-K> 5k
nnoremap <S-L> $

" tab navigation
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" file navigation
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap <space> za

nnoremap <leader>w :w<CR>
nnoremap <leader>f :Autoformat<CR>

" substitute
nnoremap <leader>sf :%s/\<<C-r><C-w>\>//g<left><left>
nnoremap <leader>sl :s/\<<C-r><C-w>\>//g<left><left>
" nnoremap <leader>ss :'<,'>s/\<<C-r><C-w>\>//g<left><left>

" open tagbar
nnoremap <leader><leader>t :TagbarOpen fjc<CR>

"source vimrc
nnoremap <leader>v :so $MYVIMRC<CR>

" run python code
nnoremap <leader><leader>r :!python %<CR>

" ctrlP mappings
" nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <C-p> :CtrlPMRUFiles<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
