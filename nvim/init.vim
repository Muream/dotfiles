if has('win32')
    " use python from virtualenvs
    let g:python_host_prog = 'C:/Users/loic/Envs/neovim-python2/Scripts/python.exe'
    let g:python3_host_prog = 'C:/Users/loic/Envs/neovim-python3/Scripts/python.exe'

    source ~/Appdata/Local/nvim/plugins.vim
    source ~/Appdata/Local/nvim/general.vim
    source ~/Appdata/Local/nvim/mappings.vim

else
    source ~/.config/nvim/plugins.vim
    source ~/.config/nvim/general.vim
    source ~/.config/nvim/mappings.vim
endif
