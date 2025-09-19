return {
    config = function()
        require("mason").setup({
            registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
        })
        require("mason-lspconfig").setup()

        vim.diagnostic.config({
            float = {
                focus = false,
                scope = "cursor",
            },
            jump = { on_jump = vim.diagnostic.open_float },
            signs = {
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                },
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.WARN] = "",
                },
            },
            update_in_insert = true,
            virtual_text = true,
        })
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/seblyng/roslyn.nvim",
        },
        {
            defer = true,
            src = "https://github.com/williamboman/mason-lspconfig.nvim",
        },
        {
            defer = true,
            src = "https://github.com/williamboman/mason.nvim",
        },
    },
    src = "https://github.com/neovim/nvim-lspconfig",
}
