return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            highlight = { additional_vim_regex_highlighting = false, enable = true },
            sync_install = true
        })
    end
}
