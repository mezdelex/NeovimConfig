local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true }
local theme = 'dropdown'

require('telescope').setup({
    pickers = {
        diagnostics = { theme = theme },
        find_files = { theme = theme },
        grep_string = { theme = theme },
        jumplist = { theme = theme },
        live_grep = { theme = theme },
        loclist = { theme = theme },
        lsp_definitions = { theme = theme },
        lsp_document_symbols = { theme = theme },
        lsp_implementations = { theme = theme },
        lsp_references = { theme = theme },
        lsp_type_definitions = { theme = theme },
        quickfix = { theme = theme }
    }
})

vim.keymap.set('n', '<leader>F', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>d', builtin.diagnostics, opts)
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<leader>j', builtin.jumplist, opts)
vim.keymap.set('n', '<leader>l', builtin.loclist, opts)
vim.keymap.set('n', '<leader>q', builtin.quickfix, opts)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, opts)
vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
vim.keymap.set('n', 'gs', builtin.grep_string, opts)
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, opts)
