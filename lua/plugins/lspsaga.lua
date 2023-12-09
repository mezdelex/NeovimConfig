return {
    'nvimdev/lspsaga.nvim',
    config = function()
        local opts = { silent = true }

        require('lspsaga').setup({
            lightbulb = { virtual_text = false },
            ui = { border = 'rounded', code_action = '' }
        })

        vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<cr>', opts)
        vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<cr>', opts)
        vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<cr>', opts)
        vim.keymap.set('n', 'gh', ':Lspsaga finder<cr>', opts)
    end
}
