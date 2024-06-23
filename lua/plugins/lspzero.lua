return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
        local lspconfig = require('lspconfig')
        local lspzero = require('lsp-zero')

        lspzero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, silent = true }

            vim.keymap.set('n', '<a-f>', vim.lsp.buf.format, opts)
            vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        end)
        lspzero.set_sign_icons({
            error = '',
            hint = '',
            info = '',
            warn = ''
        })

        require('mason').setup()
        require('mason-lspconfig').setup({
            handlers = {
                lspzero.default_setup,
                lua_ls = function()
                    lspconfig.lua_ls.setup(lspzero.nvim_lua_ls())
                end,
                omnisharp = function()
                    lspconfig.omnisharp.setup({
                        handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler }
                    })
                end,
                tsserver = function()
                    lspconfig.tsserver.setup({
                        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
                        init_options = {
                            plugins = {
                                {
                                    languages = { 'vue' },
                                    location = require('mason-registry').get_package('vue-language-server')
                                        :get_install_path() .. '/node_modules/@vue/language-server',
                                    name = '@vue/typescript-plugin'
                                }
                            }
                        }
                    })
                end
            }
        })

        vim.diagnostic.config({
            severity_sort = true,
            underline = false,
            update_in_insert = true
        })
    end,
    dependencies = {
        'Hoffs/omnisharp-extended-lsp.nvim',
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim'
    }
}
