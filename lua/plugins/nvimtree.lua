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

                vim.keymap.set('n', '<c-k>', '', { buffer = bufnr })
                vim.keymap.del('n', '<c-k>', { buffer = bufnr })
                vim.keymap.set('n', '<tab>', '', { buffer = bufnr })
                vim.keymap.del('n', '<tab>', { buffer = bufnr })
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

        vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<cr>', opts)
        vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>', opts)
    end
}
