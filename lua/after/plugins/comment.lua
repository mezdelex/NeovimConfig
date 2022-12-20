local opts = { noremap = true, silent = true }

require('nvim_comment').setup({
    comment_empty = true,
    comment_empty_trim_whitespace = true,
    create_mappings = false,
    hook = nil,
    marker_padding = true
})

vim.keymap.set({ 'n', 'v' }, '<A-/>', "<Cmd>'<,'>CommentToggle<CR>", opts)
