return {
    'nvim-telescope/telescope.nvim',
    config = function()
        local builtin = require('telescope.builtin')
        local opts = { silent = true }

        require('telescope').setup({
            defaults = { path_display = { 'truncate' } }
        })

        vim.keymap.set('n', '<leader>F', builtin.live_grep, opts)
        vim.keymap.set('n', '<leader>d', builtin.diagnostics, opts)
        vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
        vim.keymap.set('n', '<leader>j', builtin.jumplist, opts)
        vim.keymap.set('n', '<leader>q', builtin.quickfix, opts)
        vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, opts)
        vim.keymap.set({ 'n', 'v' }, 'gs', builtin.grep_string, opts)
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
}
