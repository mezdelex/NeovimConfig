return {
    'stevearc/oil.nvim',
    config = function()
        local opts = { noremap = true, silent = true }

        require('oil').setup({
            cleanup_delay_ms = 250,
            view_options = { show_hidden = true }
        })

        vim.keymap.set('n', '<leader>o', ':Oil<cr>', opts)
    end
}
