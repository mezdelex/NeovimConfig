local colors = require('gruvbox.palette')
local saga = require('lspsaga')
local opts = { noremap = true, silent = true }

saga.init_lsp_saga({
    custom_kind = {
        Array = colors.neutral_blue,
        Boolean = colors.neutral_orange,
        Class = colors.neutral_purple,
        Constant = colors.neutral_cyan,
        Constructor = colors.neutral_blue,
        Enum = colors.neutral_green,
        EnumMember = colors.neutral_green,
        Event = colors.neutral_purple,
        Field = colors.neutral_teal,
        File = colors.gray,
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
        Property = colors.neutral_cyan,
        StaticMethod = colors.neutral_orange,
        String = colors.neutral_green,
        Struct = colors.neutral_purple,
        TypeAlias = colors.neutral_green,
        TypeParameter = colors.neutral_green,
        Variable = colors.neutral_blue,
    }
})

vim.keymap.set('n', '<leader>i', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>.', '<Cmd>Lspsaga code_action<CR>', opts)
