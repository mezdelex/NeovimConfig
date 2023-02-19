return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local opts = { noremap = true, silent = true }

        require('nvim-tree').setup({
            actions = { open_file = { resize_window = true } },
            remove_keymaps = { '<C-k>', '<Tab>' }
        })

        vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
        vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
    end
}
