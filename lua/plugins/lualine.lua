return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local colors = require('gruvbox.palette').get_base_colors(vim.o.background)
        local diff_source = function()
            local gitsigns = vim.b.gitsigns_status_dict

            if gitsigns then
                return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
            end
        end
        local templates = {
            default = {
                a = { bg = colors.neutral_yellow, fg = colors.bg0, gui = 'bold' },
                b = { bg = colors.bg1, fg = colors.neutral_yellow },
                c = { bg = colors.bg1, fg = colors.neutral_yellow }
            },
            inactive = {
                a = { bg = colors.gray, fg = colors.bg0, gui = 'bold' },
                b = { bg = colors.bg1, fg = colors.gray },
                c = { bg = colors.bg1, fg = colors.gray }
            }
        }

        require('lualine').setup({
            inactive_sections = {
                lualine_a = { 'mode' },
                lualine_b = { { 'diff', source = diff_source } },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'diagnostics' },
                lualine_z = { 'filename' }
            },
            options = {
                disabled_filetypes = { 'NvimTree', statusline = {}, winbar = {} },
                theme = {
                    command = templates.default,
                    inactive = templates.inactive,
                    insert = templates.default,
                    normal = templates.default,
                    replace = templates.default,
                    visual = templates.default
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', { 'diff', source = diff_source } },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'diagnostics', 'progress' },
                lualine_z = { 'filename' }
            }
        })
    end
}
