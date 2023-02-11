return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local colors = require('gruvbox.palette').get_base_colors(vim.o.background)

        require('lualine').setup {
            extensions = {},
            inactive_sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'diff' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'diagnostics' },
                lualine_z = { 'filename' }
            },
            inactive_winbar = {},
            options = {
                always_divide_middle = true,
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'NvimTree', 'packer', statusline = {}, winbar = {} },
                globalstatus = false,
                icons_enabled = true,
                ignore_focus = {},
                refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
                section_separators = { left = '', right = '' },
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
            },
            tabline = {},
            winbar = {}
        }
    end
}