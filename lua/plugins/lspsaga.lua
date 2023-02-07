return {
    'glepnir/lspsaga.nvim',
    config = function()
        local colors = require('gruvbox.palette')
        local opts = { noremap = true, silent = true }

        require('lspsaga').setup({
            ui = {
                border = 'rounded',
                code_action = '💡',
                collapse = '',
                colors = {
                    black = colors.dark0,
                    blue = colors.neutral_blue,
                    cyan = colors.neutral_aqua,
                    green = colors.neutral_green,
                    magenta = colors.neutral_red,
                    normal_bg = colors.dark0,
                    orange = colors.neutral_orange,
                    purple = colors.neutral_purple,
                    red = colors.neutral_red,
                    title_bg = colors.dark0,
                    white = colors.gray,
                    yellow = colors.neutral_yellow
                },
                diagnostic = '🐞',
                expand = '',
                incoming = ' ',
                outgoing = ' ',
                preview = ' ',
                theme = 'round',
                winblend = 0
            }
        })

        vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '<leader>i', ':Lspsaga hover_doc<CR>', opts)
        vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
    end
}
