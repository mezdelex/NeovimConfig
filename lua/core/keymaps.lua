local opts = { silent = true }

vim.g.mapleader = ' '

vim.keymap.set('n', '<a-Q>', ':qa!<cr>', opts)
vim.keymap.set('n', '<a-q>', ':qa<cr>', opts)

vim.keymap.set('n', '<a-S>', ':wa<cr>', opts)
vim.keymap.set('n', '<a-s>', ':w<cr>', opts)

vim.keymap.set('n', '<a-C>', ':q<cr>', opts)
vim.keymap.set('n', '<a-c>', ':bp|sp|bn|bw!<cr>', opts)
vim.keymap.set('n', '<s-tab>', ':bp<cr>', opts)
vim.keymap.set('n', '<tab>', ':bn<cr>', opts)

vim.keymap.set('n', '<a-i>', '<c-w>s', opts)
vim.keymap.set('n', '<a-o>', '<c-w>v', opts)

vim.keymap.set('n', '<a-P>', '<c-w>10+', opts)
vim.keymap.set('n', '<a-U>', '<c-w>10-', opts)
vim.keymap.set('n', '<a-p>', '<c-w>10>', opts)
vim.keymap.set('n', '<a-u>', '<c-w>10<', opts)

vim.keymap.set('n', '<a-h>', '<c-w>h', opts)
vim.keymap.set('n', '<a-j>', '<c-w>j', opts)
vim.keymap.set('n', '<a-k>', '<c-w>k', opts)
vim.keymap.set('n', '<a-l>', '<c-w>l', opts)

vim.keymap.set({ 'n', 'v' }, '<c-h>', '5b', opts)
vim.keymap.set({ 'n', 'v' }, '<c-j>', '5j', opts)
vim.keymap.set({ 'n', 'v' }, '<c-k>', '5k', opts)
vim.keymap.set({ 'n', 'v' }, '<c-l>', '5e', opts)

vim.keymap.set('n', '[j', '<c-o>', opts)
vim.keymap.set('n', ']j', '<c-i>', opts)

vim.keymap.set('n', '[q', ':cp<cr>', opts)
vim.keymap.set('n', ']q', ':cn<cr>', opts)

vim.keymap.set('n', 'U', '<c-r>')

vim.keymap.set('n', '<a-v>', '<c-v>', opts)

vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", opts)

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts)
