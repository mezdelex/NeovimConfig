return {
    'nvimdev/lspsaga.nvim',
    config = function()
        local opts = { noremap = true, silent = true }

        require('lspsaga').setup({
            lightbulb = { virtual_text = false },
            ui = { border = 'rounded', code_action = '' }
        })

        vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'gh', ':Lspsaga finder<CR>', opts)
    end
}
