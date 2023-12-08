vim.opt.cursorline = true
vim.opt.guicursor = 'a:blinkon1'
vim.opt.scrolloff = math.floor(0.5 * vim.o.lines)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = 'yes'

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.showmode = false

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv('HOMEPATH') .. '/.nvim/undodir'
vim.opt.undofile = true

vim.opt.updatetime = 250
