return {
    'glepnir/lspsaga.nvim',
    config = function()
        local colors = require('gruvbox.palette').get_base_colors(vim.o.background)
        local opts = { noremap = true, silent = true }

        require('lspsaga').setup({
            ui = {
                border = 'rounded',
                colors = {
                    black = colors.bg0,
                    blue = colors.neutral_blue,
                    cyan = colors.neutral_aqua,
                    green = colors.neutral_green,
                    magenta = colors.neutral_red,
                    normal_bg = colors.bg0,
                    orange = colors.neutral_orange,
                    purple = colors.neutral_purple,
                    red = colors.neutral_red,
                    title_bg = colors.bg0,
                    white = colors.gray,
                    yellow = colors.neutral_yellow
                },
            }
        })

        vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '<leader>i', ':Lspsaga hover_doc<CR>', opts)
        vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
    end
}
