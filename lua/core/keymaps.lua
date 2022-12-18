vim.g.mapleader = ' '

vim.keymap.set('n', '<A-C>', ':q<CR>')
vim.keymap.set('n', '<A-Q>', ':qa!<CR>')
vim.keymap.set('n', '<A-q>', ':qa<CR>')

vim.keymap.set('n', '<C-S>', ':wa<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<A-c>', ':bd<CR>')
vim.keymap.set('n', '<S-Tab>', ':bp<CR>')
vim.keymap.set('n', '<Tab>', ':bn<CR>')

vim.keymap.set('n', '<A-i>', '<C-w>s')
vim.keymap.set('n', '<A-o>', '<C-w>v')

vim.keymap.set('n', '<A-P>', '<C-w>10+')
vim.keymap.set('n', '<A-U>', '<C-w>10-')
vim.keymap.set('n', '<A-p>', '<C-w>10>')
vim.keymap.set('n', '<A-u>', '<C-w>10<')

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

vim.keymap.set('i', '<C-h>', '<left>')
vim.keymap.set('i', '<C-j>', '<down>')
vim.keymap.set('i', '<C-k>', '<up>')
vim.keymap.set('i', '<C-l>', '<right>')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('v', 'J', ":m'>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m'<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<C-[>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-]>', '<cmd>cprev<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>lnext<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>lprev<CR>')

vim.keymap.set('n', '<A-/>', ':%s/<C-r><C-w>/<C-r><C-w>')
vim.keymap.set('v', '<A-/>', ':s/^\\(.*\\)/\\1<left><left>')
