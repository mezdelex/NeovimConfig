return {
    'terrortylor/nvim-comment',
    config = function()
        local opts = { noremap = true, silent = true }

        require('nvim_comment').setup({
            comment_empty = true,
            comment_empty_trim_whitespace = true,
            create_mappings = false,
            hook = nil,
            marker_padding = true
        })

        vim.keymap.set('v', '<A-/>', ":'<,'>CommentToggle<CR>", opts)
    end
}
