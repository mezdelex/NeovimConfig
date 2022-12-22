local opts = { noremap = true, silent = true }

require('nvim-tree').setup({
    actions = { open_file = { resize_window = true } },
    disable_netrw = true,
    filesystem_watchers = { enable = true },
    filters = { dotfiles = false },
    git = { enable = false, ignore = true },
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_setup = false,
    remove_keymaps = { '<C-k>', '<Tab>' },
    renderer = {
        highlight_git = false,
        highlight_opened_files = 'none',
        icons = {
            glyphs = {
                default = '',
                folder = {
                    arrow_closed = '',
                    arrow_open = '',
                    default = '',
                    empty = '',
                    empty_open = '',
                    open = '',
                    symlink = '',
                    symlink_open = ''
                },
                git = {
                    deleted = '',
                    ignored = '◌',
                    renamed = '➜',
                    staged = '✓',
                    unmerged = '',
                    unstaged = '✗',
                    untracked = '★'
                },
                symlink = ''
            },
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false
            }
        },
        indent_markers = { enable = false },
    },
    update_cwd = true,
    update_focused_file = { enable = true, update_cwd = false },
    view = {
        adaptive_size = true,
        hide_root_folder = true,
        side = 'left',
        width = 25
    }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
