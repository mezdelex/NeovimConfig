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
        kind = {
            Array = colors.neutral_blue,
            Boolean = colors.neutral_orange,
            Class = colors.neutral_purple,
            Constant = colors.neutral_aqua,
            Constructor = colors.neutral_blue,
            Enum = colors.neutral_green,
            EnumMember = colors.neutral_green,
            Event = colors.neutral_purple,
            Field = colors.neutral_aqua,
            File = colors.gray,
            Folder = colors.neutral_yellow,
            Function = colors.neutral_purple,
            Interface = colors.neutral_orange,
            Key = colors.neutral_red,
            Macro = colors.neutral_red,
            Method = colors.neutral_purple,
            Module = colors.neutral_blue,
            Namespace = colors.neutral_orange,
            Null = colors.neutral_red,
            Number = colors.neutral_green,
            Object = colors.neutral_orange,
            Operator = colors.neutral_green,
            Package = colors.neutral_purple,
            Parameter = colors.neutral_blue,
            Property = colors.neutral_aqua,
            Snippet = colors.neutral_blue,
            StaticMethod = colors.neutral_orange,
            String = colors.neutral_green,
            Struct = colors.neutral_purple,
            Text = colors.neutral_green,
            TypeAlias = colors.neutral_green,
            TypeParameter = colors.neutral_green,
            Unit = colors.neutral_aqua,
            Value = colors.neutral_blue,
            Variable = colors.neutral_blue,
        },
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
