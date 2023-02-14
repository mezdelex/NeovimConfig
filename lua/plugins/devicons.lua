return {
    'nvim-tree/nvim-web-devicons',
    config = function()
        require('nvim-web-devicons').setup({
            color_icons = true,
            default = true
        })
    end
}
