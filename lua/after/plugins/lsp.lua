local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.diagnostic.config({
        float = true,
        severity_sort = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        virtual_text = true,
    })
    vim.keymap.set('i', '<C-e>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>,', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>.', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>i', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>s', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'gn', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', 'gp', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
end)
lsp.nvim_workspace()
lsp.setup()
