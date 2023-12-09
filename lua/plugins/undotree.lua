return {
    'mbbill/undotree',
    config = function()
        local opts = { silent = true }

        vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>', opts)
    end
}
