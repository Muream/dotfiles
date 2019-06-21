autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

let $FZF_DEFAULT_OPTS = ' --layout=reverse'
"
" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  let height = float2nr(&lines * 0.3)
  let width = float2nr(&columns * 0.35)

  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)

  " remove numbers from the fzf window only
  setlocal nonumber
  setlocal norelativenumber

endfunction

" Mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader><leader>t :Tags<CR>
nnoremap <C-p> :Files<CR>
