require('nvim-autopairs').setup({
    break_undo = true,
    check_ts = false,
    disable_filetype = { 'TelescopePrompt' },
    disable_in_macro = false,
    disable_in_replace_mode = true,
    disable_in_visualblock = false,
    enable_abbr = false,
    enable_afterquote = true,
    enable_bracket_in_quote = true,
    enable_check_bracket_line = true,
    enable_moveright = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
})
