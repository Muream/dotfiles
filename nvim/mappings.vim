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

"source vimrc
nnoremap <leader>v :so $MYVIMRC<CR>

" run python code
nnoremap <leader><leader>r :!python %<CR>

" ctrlP mappings
" nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <C-p> :CtrlP<CR>

nnoremap <leader>k :NERDTreeToggle<CR>
