return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'jay-babu/mason-null-ls.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'neovim/nvim-lspconfig',
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim'
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')
        lsp.set_preferences({ set_lsp_keymaps = false })
        lsp.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.diagnostic.config({
                float = true,
                severity_sort = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                virtual_text = true
            })

            vim.keymap.set('n', '<A-f>', function() vim.lsp.buf.format() end, opts)
            vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, opts)
        end)
        lsp.nvim_workspace()
        lsp.setup()

        local null_ls = require('null-ls')
        local null_opts = lsp.build_options('null-ls', {})

        null_ls.setup({
            on_attach = function(client, bufnr)
                null_opts.on_attach(client, bufnr)
            end,
            sources = {
                null_ls.builtins.formatting.prettier
            }
        })

        local mason_null_ls = require('mason-null-ls')

        mason_null_ls.setup({
            automatic_installation = true,
            automatic_setup = true
        })
        mason_null_ls.setup_handlers()
    end
}
