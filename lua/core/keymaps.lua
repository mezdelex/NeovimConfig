local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.keymap.set('n', '<A-Q>', ':qa!<CR>', opts)
vim.keymap.set('n', '<A-q>', ':qa<CR>', opts)

vim.keymap.set('n', '<C-S>', ':wa<CR>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)

vim.keymap.set('n', '<A-C>', ':bd<CR>', opts)
vim.keymap.set('n', '<A-c>', ':q<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', opts)
vim.keymap.set('n', '<Tab>', ':bn<CR>', opts)

vim.keymap.set('n', '<A-i>', '<C-w>s', opts)
vim.keymap.set('n', '<A-o>', '<C-w>v', opts)

vim.keymap.set('n', '<A-P>', '<C-w>10+', opts)
vim.keymap.set('n', '<A-U>', '<C-w>10-', opts)
vim.keymap.set('n', '<A-p>', '<C-w>10>', opts)
vim.keymap.set('n', '<A-u>', '<C-w>10<', opts)

vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

vim.keymap.set('n', '<C-h>', '5b', opts)
vim.keymap.set('n', '<C-j>', '5j', opts)
vim.keymap.set('n', '<C-k>', '5k', opts)
vim.keymap.set('n', '<C-l>', '5e', opts)

vim.keymap.set('i', '<C-h>', '<left>', opts)
vim.keymap.set('i', '<C-j>', '<down>', opts)
vim.keymap.set('i', '<C-k>', '<up>', opts)
vim.keymap.set('i', '<C-l>', '<right>', opts)

vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('v', 'J', ":m'>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m'<-2<CR>gv=gv", opts)

vim.keymap.set('n', '<A-/>', ':%s/<C-r><C-w>/<C-r><C-w>', opts)
