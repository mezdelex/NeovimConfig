local saga = require('lspsaga')
local opts = { noremap = true, silent = true }

saga.init_lsp_saga()

vim.keymap.set('n', '<leader>i', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>.', '<Cmd>Lspsaga code_action<CR>', opts)
