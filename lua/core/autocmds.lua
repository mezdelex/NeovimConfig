vim.api.nvim_create_augroup("init", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local options = { buffer = event.buf }

        vim.keymap.set("n", "<a-f>", vim.lsp.buf.format, options)
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, options)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, options)
    end,
    group = "init",
})
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
    group = "init",
})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("clearjumps")
    end,
    group = "init",
})
