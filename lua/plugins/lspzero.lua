return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
        local cmp = require("cmp")
        local lspconfig = require("lspconfig")
        local lspzero = require("lsp-zero")

        lspzero.on_attach(function(_, bufnr)
            local opts = {
                buffer = bufnr,
                silent = true,
            }

            vim.keymap.set("n", "<a-f>", vim.lsp.buf.format, opts)
            vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        end)
        lspzero.set_sign_icons({
            error = "",
            hint = "",
            info = "",
            warn = "",
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            handlers = {
                lspzero.default_setup,
                lua_ls = function()
                    lspconfig.lua_ls.setup(lspzero.nvim_lua_ls())
                end,
                omnisharp = function()
                    lspconfig.omnisharp.setup({
                        handlers = {
                            ["textDocument/definition"] = require("omnisharp_extended").handler,
                        },
                    })
                end,
                ts_ls = function()
                    lspconfig.ts_ls.setup({
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                        },
                        init_options = {
                            plugins = {
                                {
                                    languages = { "vue" },
                                    location = require("mason-registry")
                                        .get_package("vue-language-server")
                                        :get_install_path() .. "/node_modules/@vue/language-server",
                                    name = "@vue/typescript-plugin",
                                },
                            },
                        },
                    })
                end,
            },
        })

        cmp.setup({
            mapping = {
                ["<cr>"] = cmp.mapping.confirm({
                    select = true,
                }),
            },
        })

        vim.diagnostic.config({
            severity_sort = true,
            underline = false,
            update_in_insert = true,
        })
    end,
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
}
