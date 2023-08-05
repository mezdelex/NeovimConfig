return {
    'ellisonleao/gruvbox.nvim',
    config = function()
        require('gruvbox').setup({
            bold = true,
            contrast = '',
            dim_inactive = false,
            inverse = true,
            invert_intend_guides = false,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            italic = {
                comments = false,
                folds = false,
                operators = false,
                strings = false
            },
            overrides = {},
            palette_overrides = {},
            strikethrough = true,
            transparent_mode = false,
            undercurl = true,
            underline = true
        })

        vim.cmd.colorscheme('gruvbox')
        vim.o.background = 'dark'
    end
}
