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
        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            if client.name == 'omnisharp' then
                client.server_capabilities.semanticTokensProvider = {
                    full = vim.empty_dict(),
                    legend = {
                        tokenModifiers = { 'static_symbol' },
                        tokenTypes = { 'class_name', 'comment', 'constant_name', 'delegate_name', 'enum_member_name',
                            'enum_name', 'event_name', 'excluded_code', 'extension_method_name', 'field_name',
                            'identifier', 'interface_name', 'keyword', 'keyword_control', 'label_name', 'local_name',
                            'method_name', 'module_name', 'namespace_name', 'number', 'operator', 'operator_overloaded',
                            'parameter_name', 'preprocessor_keyword', 'preprocessor_text', 'property_name',
                            'punctuation', 'regex_alternation', 'regex_anchor', 'regex_character_class', 'regex_comment',
                            'regex_grouping', 'regex_other_escape', 'regex_quantifier', 'regex_self_escaped_character',
                            'regex_text', 'static_symbol', 'string', 'string_escape_character', 'string_verbatim',
                            'struct_name', 'text', 'type_parameter_name', 'whitespace', 'xml_doc_comment_attribute_name',
                            'xml_doc_comment_attribute_quotes', 'xml_doc_comment_attribute_value',
                            'xml_doc_comment_cdata_section', 'xml_doc_comment_comment', 'xml_doc_comment_delimiter',
                            'xml_doc_comment_entity_reference', 'xml_doc_comment_name',
                            'xml_doc_comment_processing_instruction', 'xml_doc_comment_text',
                            'xml_literal_attribute_name', 'xml_literal_attribute_quotes', 'xml_literal_attribute_value',
                            'xml_literal_cdata_section', 'xml_literal_comment', 'xml_literal_delimiter',
                            'xml_literal_embedded_expression', 'xml_literal_entity_reference', 'xml_literal_name',
                            'xml_literal_processing_instruction', 'xml_literal_text' }
                    },
                    range = true
                }
            end

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
    end
}
