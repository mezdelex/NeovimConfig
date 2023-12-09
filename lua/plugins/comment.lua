return {
    'terrortylor/nvim-comment',
    config = function()
        local opts = { silent = true }

        require('nvim_comment').setup({
            create_mappings = false
        })

        vim.g.skip_ts_context_commentstring_module = true
        vim.keymap.set('n', '<a-/>', ':CommentToggle<cr>', opts)
        vim.keymap.set('v', '<a-/>', ":'<,'>CommentToggle<cr>", opts)
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
}
