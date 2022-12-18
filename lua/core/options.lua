vim.opt.guicursor = 'a:blinkon1'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.scrolloff = 24
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv('HOMEPATH') .. '/.nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true

vim.opt.isfname:append('@-@')

vim.opt.updatetime = 250
