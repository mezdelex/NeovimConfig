return {
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup({
            integrations = { dap = { enabled = true } },
            no_italic = true
        })

        vim.cmd.colorscheme('catppuccin')
        vim.o.background = 'dark'
    end
}
