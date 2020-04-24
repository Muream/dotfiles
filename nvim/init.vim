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
