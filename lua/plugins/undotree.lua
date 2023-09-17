return {
    'mbbill/undotree',
    config = function()
        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>', opts)
    end
}
