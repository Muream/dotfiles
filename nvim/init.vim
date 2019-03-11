if has('win32')
    " use python from virtualenvs
    let g:python_host_prog = 'C:/Users/muream/Envs/neovim-python2/Scripts/python.exe'
    let g:python3_host_prog = 'C:/Users/muream/Envs/neovim-python3/Scripts/python.exe'
else
    let g:python_host_prog = '/home/muream/.virtualenvs/neovim2/bin/python'
    let g:python3_host_prog = '/home/muream/.virtualenvs/neovim3/bin/python'
endif

source ~/Projects/dotfiles/nvim/mappings.vim
source ~/Projects/dotfiles/nvim/plugins.vim
source ~/Projects/dotfiles/nvim/general.vim
