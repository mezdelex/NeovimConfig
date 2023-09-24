return {
    'ellisonleao/gruvbox.nvim',
    config = function()
        require('gruvbox').setup({
            italic = { comments = false, emphasis = false, folds = false, operators = false, strings = false }
        })

        vim.cmd.colorscheme('gruvbox')
        vim.o.background = 'dark'
    end
}
