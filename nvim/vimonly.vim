" General
set encoding=utf-8
set autoread
let g:python3_host_prog='C:/Users/loic/AppData/Local/Programs/Python/Python36-32/python.exe'

" GUI
if has("gui_running")
  set guioptions-=m                     " remove menu bar
  set guioptions-=T                     " remove toolbar
  set guioptions-=r                     " remove right-hand scroll bar
  set guioptions-=L                     " remove left-hand scroll bar

  " Change the font of the gvim
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

" Colors
syntax enable                           " enable syntax highlighting

" Interface
set backspace=2 " make backspace work like most other apps
set visualbell
set t_vb=
