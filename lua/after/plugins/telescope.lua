local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>F', builtin.live_grep)
vim.keymap.set('n', '<leader>G', builtin.grep_string)
vim.keymap.set('n', '<leader>f', builtin.find_files)
