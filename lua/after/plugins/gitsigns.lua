require('gitsigns').setup {
    attach_to_untracked          = true,
    current_line_blame           = false,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    current_line_blame_opts      = {
        delay = 1000,
        ignore_whitespace = false,
        virt_text = true,
        virt_text_pos = 'eol',
    },
    linehl                       = false,
    max_file_length              = 40000,
    numhl                        = false,
    preview_config               = {
        border = 'single',
        col = 1,
        relative = 'cursor',
        row = 0,
        style = 'minimal',
    },
    sign_priority                = 6,
    signcolumn                   = true,
    signs                        = {
        add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    },
    status_formatter             = nil,
    update_debounce              = 100,
    watch_gitdir                 = {
        follow_files = true,
        interval = 1000,
    },
    word_diff                    = false,
    yadm                         = {
        enable = false
    },
}
