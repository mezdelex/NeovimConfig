require('lualine').setup {
    extensions = {},
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {},
    options = {
        always_divide_middle = true,
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        globalstatus = false,
        icons_enabled = true,
        ignore_focus = {},
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        section_separators = { left = '', right = '' },
        theme = 'gruvbox',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    tabline = {},
    winbar = {},
}
