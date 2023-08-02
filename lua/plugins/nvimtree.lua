return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local opts = { noremap = true, silent = true }
        local api = require('nvim-tree.api')

        require('nvim-tree').setup({
            on_attach = function(bufnr)
                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
                vim.keymap.del('n', '<C-k>', { buffer = bufnr })
                vim.keymap.set('n', '<Tab>', '', { buffer = bufnr })
                vim.keymap.del('n', '<Tab>', { buffer = bufnr })
            end
        })

        vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
        vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
    end
}
