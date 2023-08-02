return {
    'glepnir/lspsaga.nvim',
    config = function()
        local opts = { noremap = true, silent = true }

        require('lspsaga').setup({
            ui = { border = 'rounded' }
        })

        vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '<leader>i', ':Lspsaga hover_doc<CR>', opts)
        vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'gh', ':Lspsaga finder<CR>', opts)
    end
}
