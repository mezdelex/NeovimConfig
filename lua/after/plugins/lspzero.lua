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
