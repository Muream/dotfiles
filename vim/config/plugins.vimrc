" airline
set laststatus=2                                    " airline always visible
set noshowmode                                      " shows mode only in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''
let g:airline_right_sep=''

" NERDTree
let g:NERDTreeQuitOnOpen=0                          " don't close NERDTree when opening a file
let NERDTreeShowHidden=1                            " show hidden files
let NERDTreeIgnore = ['\.pyc$']                     " ignored files

" vim session
let g:session_directory = "~/.vim/sessions"         " save session files directory
let g:session_autoloadd = "yes"                     " automatically load latest session
let g:session_autosave = "yes"                      " automatially save session

"git gutter
set updatetime=250                                  " git gutter is fast

" PyMode
let g:pymode_rope = 0                               " Disable Rope
let g:pymode_lint = 0                               " Disable syntax checking, we have syntastic for that

" supertab
let g:SuperTabLongestHighlight= 1                  " select first item of the autocompletion
let g:SuperTabCrMapping = 1                         " validate completion with <CR>
let g:SuperTabClosePreviewOnPopupClose = 1          " close preview when completion is done
let g:SuperTabDefaultCompletionType = "<c-n>"       " supertab goes forward!
