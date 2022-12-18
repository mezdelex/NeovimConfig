local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>F', builtin.live_grep)
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.grep_string)
