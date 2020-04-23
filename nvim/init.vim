" if has('win32')
"     " use python from virtualenvs
"     let g:python_host_prog = 'C:/Users/muream/Envs/neovim-python2/Scripts/python.exe'
"     let g:python3_host_prog = 'C:/Users/muream/Envs/neovim-python3/Scripts/python.exe'
" else
"     let g:python_host_prog = '/home/muream/.virtualenvs/neovim2/bin/python'
"     let g:python3_host_prog = '/home/muream/.virtualenvs/neovim3/bin/python'
" endif

" source ~/projects/dotfiles/nvim/viml/plugins.vim
" source ~/projects/dotfiles/nvim/viml/mappings.vim
" source ~/projects/dotfiles/nvim/viml/general.vim
" source ~/projects/dotfiles/nvim/viml/coc.vim
" source ~/projects/dotfiles/nvim/viml/fzf.vim


" Automatically install vim-plug if it's not
if has('win32')
    if empty(glob('C:/Users/muream/AppData/Local/nvim/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo C:/Users/muream/AppData/Local/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        echo 'Fetching plug.vim...'
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif


luafile ~/projects/dotfiles/nvim/init.lua
