return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local bold = { gui = 'bold' }
        local colors = require('gruvbox').palette
        local diff_source = function()
            local gitsigns = vim.b.gitsigns_status_dict

            if gitsigns then
                return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
            end
        end
        local sections = {
            diagnostics = {
                'diagnostics',
                symbols = { error = ' ', hint = ' ', info = ' ', warn = ' ' },
                update_in_insert = true
            },
            diff = {
                'diff',
                diff_color = {
                    added = { fg = colors.bright_green },
                    modified = { fg = colors.bright_aqua },
                    removed = { fg = colors.bright_red }
                },
                source = diff_source,
                symbols = { added = ' ', modified = ' ', removed = ' ' }
            },
            filename = {
                'filename',
                newfile_status = true,
                symbols = { modified = '', newfile = '', readonly = '', unnamed = '[No Name]' }
            }
        }
        local templates = {
            default = {
                a = { bg = colors.neutral_yellow, fg = colors.dark0, bold },
                b = { bg = colors.dark2, fg = colors.bright_yellow, bold },
                c = { bg = colors.dark1, bold }
            },
            inactive = {
                a = { bg = colors.gray, fg = colors.dark0, bold },
                b = {},
                c = { bg = colors.dark1, bold }
            }
        }

        require('lualine').setup({
            inactive_sections = {
                lualine_a = { 'mode' },
                lualine_b = {},
                lualine_c = { sections.diff },
                lualine_x = { sections.diagnostics },
                lualine_y = {},
                lualine_z = { sections.filename }
            },
            options = {
                component_separators = {},
                disabled_filetypes = {
                    'dap-repl',
                    'dapui_breakpoints',
                    'dapui_console',
                    'dapui_scopes',
                    'dapui_stacks',
                    'dapui_watches',
                    statusline = {},
                    winbar = {}
                },
                section_separators = {},
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
                lualine_b = { 'branch' },
                lualine_c = { sections.diff },
                lualine_x = { sections.diagnostics },
                lualine_y = { 'progress' },
                lualine_z = { sections.filename }
            }
        })
    end
}
