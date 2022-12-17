local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>F', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)
vim.keymap.set('n', '<leader>G', builtin.git_files, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
