return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local colors = require('gruvbox.palette').get_base_colors(vim.o.background)

        require('lualine').setup {
            inactive_sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'diff' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'diagnostics' },
                lualine_z = { 'filename' }
            },
            options = {
                disabled_filetypes = { 'NvimTree', 'packer', statusline = {}, winbar = {} },
                theme = {
                    command = {
                        a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.neutral_yellow },
                        c = { bg = colors.bg1, fg = colors.neutral_yellow }
                    },
                    inactive = {
                        a = { bg = colors.gray, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.gray },
                        c = { bg = colors.bg1, fg = colors.gray }
                    },
                    insert = {
                        a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.neutral_yellow },
                        c = { bg = colors.bg1, fg = colors.neutral_yellow }
                    },
                    normal = {
                        a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.neutral_yellow },
                        c = { bg = colors.bg1, fg = colors.neutral_yellow }
                    },
                    replace = {
                        a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.neutral_yellow },
                        c = { bg = colors.bg1, fg = colors.neutral_yellow }
                    },
                    visual = {
                        a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                        b = { bg = colors.bg1, fg = colors.neutral_yellow },
                        c = { bg = colors.bg1, fg = colors.neutral_yellow }
                    }
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'diagnostics', 'progress' },
                lualine_z = { 'filename' }
            }
        }
    end
}
