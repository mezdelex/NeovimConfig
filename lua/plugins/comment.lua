return {
    'terrortylor/nvim-comment',
    config = function()
        local opts = { silent = true }

        require('ts_context_commentstring').setup({
            enable_autocmd = false
        })

        require('nvim_comment').setup({
            create_mappings = false,
            hook = function()
                require('ts_context_commentstring').update_commentstring()
            end
        })

        vim.g.skip_ts_context_commentstring_module = true
        vim.keymap.set('n', '<a-/>', ':CommentToggle<cr>', opts)
        vim.keymap.set('v', '<a-/>', ":'<,'>CommentToggle<cr>", opts)
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
}
