if has('win32')
    " use python from virtualenvs
    let g:python_host_prog = 'C:/Users/loic/Envs/neovim-python2/Scripts/python.exe'
    let g:python3_host_prog = 'C:/Users/loic/Envs/neovim-python3/Scripts/python.exe'
endif

source ~/github/dotfiles/nvim/plugins.vim
source ~/github/dotfiles/nvim/general.vim
source ~/github/dotfiles/nvim/mappings.vim
