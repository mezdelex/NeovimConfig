local colors = require('gruvbox.palette')
local saga = require('lspsaga')
local opts = { noremap = true, silent = true }
local highlights = {
    ColInLineDiagnostic = { link = 'Comment' },
    DefinitionArrow = { fg = colors.neutral_red },
    DefinitionBorder = { fg = colors.neutral_aqua },
    DefinitionCount = { link = 'Title' },
    DefinitionFile = { bg = colors.neutral_blue },
    DefinitionSearch = { link = 'Search' },
    Definitions = { fg = colors.neutral_purple, bold = true },
    DefinitionsIcon = { fg = colors.neutral_yellow },
    DiagnosticLineCol = { fg = colors.gray },
    DiagnosticMap = { fg = colors.neutral_purple },
    DiagnosticQuickFix = { fg = colors.neutral_green, bold = true },
    FinderParam = { fg = colors.neutral_purple, bg = colors.dark0, bold = true },
    FinderPreviewSearch = { link = 'Search' },
    FinderSpinner = { fg = colors.neutral_purple, bold = true },
    FinderSpinnerBorder = { fg = colors.neutral_blue },
    FinderSpinnerTitle = { fg = colors.neutral_purple, bold = true },
    FinderVirtText = { fg = colors.neutral_red },
    Implements = { fg = colors.neutral_purple, bold = true },
    ImplementsCount = { link = 'Title' },
    ImplementsIcon = { fg = colors.neutral_yellow },
    LSOutlinePreviewBorder = { fg = colors.neutral_aqua },
    LspFloatWinNormal = { link = 'Normal' },
    LspSagaAutoPreview = { fg = colors.neutral_blue },
    LspSagaBorderTitle = { link = 'String' },
    LspSagaCodeActionBorder = { fg = colors.neutral_purple },
    LspSagaCodeActionContent = { fg = colors.neutral_green, bold = true },
    LspSagaCodeActionTitle = { fg = colors.neutral_orange, bold = true },
    LspSagaCodeActionTrunCateLine = { link = 'LspSagaCodeActionBorder' },
    LspSagaDiagnosticBorder = { fg = colors.neutral_purple },
    LspSagaDiagnosticError = { link = 'DiagnosticError' },
    LspSagaDiagnosticHeader = { fg = colors.neutral_green },
    LspSagaDiagnosticHint = { link = 'DiagnosticHint' },
    LspSagaDiagnosticInfo = { link = 'DiagnosticInfo' },
    LspSagaDiagnosticSource = { link = 'Comment' },
    LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
    LspSagaDiagnosticWarn = { link = 'DiagnosticWarn' },
    LspSagaErrorTrunCateLine = { link = 'DiagnosticError' },
    LspSagaFinderSelection = { fg = colors.neutral_green, bold = true },
    LspSagaHintTrunCateLine = { link = 'DiagnosticHint' },
    LspSagaHoverBorder = { fg = colors.neutral_yellow },
    LspSagaHoverTrunCateLine = { link = 'LspSagaHoverBorder' },
    LspSagaInfoTrunCateLine = { link = 'DiagnosticInfo' },
    LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    LspSagaLspFinderBorder = { fg = colors.neutral_blue },
    LspSagaRenameBorder = { fg = colors.neutral_aqua },
    LspSagaRenameMatch = { link = 'Search' },
    LspSagaShTrunCateLine = { link = 'LspSagaSignatureHelpBorder' },
    LspSagaSignatureHelpBorder = { fg = colors.neutral_green },
    LspSagaWarnTrunCateLine = { link = 'DiagnosticWarn' },
    OutlineDetail = { fg = colors.gray },
    OutlineFoldPrefix = { fg = colors.neutral_red },
    OutlineIndentEvn = { fg = colors.neutral_purple },
    OutlineIndentOdd = { fg = colors.neutral_orange },
    References = { fg = colors.neutral_purple, bold = true },
    ReferencesCount = { link = 'Title' },
    ReferencesIcon = { fg = colors.neutral_yellow },
    SagaShadow = { fg = colors.dark0 },
    TargetFileName = { fg = colors.gray }
}

for group, values in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, vim.tbl_extend('keep', values, { default = true }))
end

saga.init_lsp_saga({
    custom_kind = {
        Array = colors.neutral_blue,
        Boolean = colors.neutral_orange,
        Class = colors.neutral_purple,
        Constant = colors.neutral_cyan,
        Constructor = colors.neutral_blue,
        Enum = colors.neutral_green,
        EnumMember = colors.neutral_green,
        Event = colors.neutral_purple,
        Field = colors.neutral_teal,
        File = colors.yellow,
        Function = colors.neutral_purple,
        Interface = colors.neutral_orange,
        Key = colors.neutral_red,
        Macro = colors.neutral_red,
        Method = colors.neutral_purple,
        Module = colors.neutral_blue,
        Namespace = colors.neutral_orange,
        Null = colors.neutral_red,
        Number = colors.neutral_green,
        Object = colors.neutral_orange,
        Operator = colors.neutral_green,
        Package = colors.neutral_purple,
        Parameter = colors.neutral_blue,
        Property = colors.neutral_cyan,
        StaticMethod = colors.neutral_orange,
        String = colors.neutral_green,
        Struct = colors.neutral_purple,
        TypeAlias = colors.neutral_green,
        TypeParameter = colors.neutral_green,
        Variable = colors.neutral_blue
    }
})

vim.keymap.set('n', '<leader>.', ':Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>i', ':Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>o', ':Lspsaga outline<CR>', opts)
vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
