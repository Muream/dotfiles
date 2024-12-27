return {
    {
        'echasnovski/mini.splitjoin',
        version = '*',
        config = function()
            require('mini.splitjoin').setup({
                mappings = {
                    toggle = '<leader>s',
                    split = '',
                    join = '',
                },
            })
        end
    }
}
