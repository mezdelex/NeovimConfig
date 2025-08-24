return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require("fzf-lua")

        fzf.setup({
            defaults = { formatter = "path.filename_first" },
            keymap = {
                builtin = { ["<a-p>"] = "toggle-preview" },
                fzf = {
                    ["alt-a"] = "toggle-all",
                    ["alt-s"] = "toggle",
                },
            },
            winopts = {
                preview = {
                    layout = "vertical",
                    scrollbar = false,
                    vertical = "up:70%",
                },
            },
        })

        vim.keymap.set("n", "<leader>F", fzf.live_grep)
        vim.keymap.set("n", "<leader>d", fzf.diagnostics_workspace)
        vim.keymap.set("n", "<leader>f", fzf.files)
        vim.keymap.set("n", "<leader>j", fzf.jumps)
        vim.keymap.set("n", "<leader>q", fzf.quickfix)
        vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols)
        vim.keymap.set("n", "gs", fzf.grep_cword)
        vim.keymap.set("v", "gs", fzf.grep_visual)
    end,
}
