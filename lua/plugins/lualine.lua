return {
    'nvim-lualine/lualine.nvim',
    config = function()
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
                source = diff_source,
                symbols = { added = ' ', modified = ' ', removed = ' ' }
            },
            filename = {
                'filename',
                newfile_status = true,
                symbols = { modified = '', newfile = '', readonly = '', unnamed = '[No Name]' }
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
                theme = 'catppuccin'
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
