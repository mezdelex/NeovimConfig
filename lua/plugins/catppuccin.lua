return {
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup({
            no_italic = true
        })

        vim.cmd.colorscheme('catppuccin')
        vim.o.background = 'dark'
    end
}
