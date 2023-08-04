return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            context_commentstring = { enable = true },
            highlight = { additional_vim_regex_highlighting = false, enable = true },
            sync_install = true
        })
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
}
