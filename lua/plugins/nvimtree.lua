return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local api = require('nvim-tree.api')
        local opts = { noremap = true, silent = true }

        require('nvim-tree').setup({
            actions = {
                open_file = {
                    window_picker = {
                        enable = false
                    }
                }
            },
            on_attach = function(bufnr)
                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
                vim.keymap.del('n', '<C-k>', { buffer = bufnr })
                vim.keymap.set('n', '<Tab>', '', { buffer = bufnr })
                vim.keymap.del('n', '<Tab>', { buffer = bufnr })
            end,
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            deleted = '',
                            ignored = '',
                            renamed = '',
                            staged = '',
                            unmerged = '',
                            unstaged = '',
                            untracked = ''
                        }
                    }
                }
            }
        })

        vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
        vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
    end
}
