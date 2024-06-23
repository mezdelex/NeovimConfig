return {
    'hrsh7th/nvim-cmp',
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            mapping = {
                ['<cr>'] = cmp.mapping.confirm({
                    select = true
                })
            }
        })
    end,
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip'
    }
}
