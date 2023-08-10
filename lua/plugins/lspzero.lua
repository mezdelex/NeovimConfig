return {
    'VonHeikemen/lsp-zero.nvim',
    config = function()
        local cmp = require('cmp')
        local lspzero = require('lsp-zero').preset()

        require('lspconfig').lua_ls.setup(lspzero.nvim_lua_ls())

        lspzero.default_keymaps({})
        lspzero.set_sign_icons({ error = '󰅚', hint = '󰌶', info = '󰋽', warn = '󰀪' })
        lspzero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.keymap.set('n', '<A-f>', function() vim.lsp.buf.format() end, opts)
            vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, opts)
        end)
        lspzero.setup()

        cmp.setup({
            mapping = { ['<CR>'] = cmp.mapping.confirm({ select = true }) }
        })

        vim.diagnostic.config({
            float = true,
            severity_sort = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            virtual_text = true
        })
    end,
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'neovim/nvim-lspconfig',
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim'
    }
}
