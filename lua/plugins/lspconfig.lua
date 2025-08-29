---@type Utils.Pack.Spec
return {
    src = "https://github.com/neovim/nvim-lspconfig",
    config = function()
        require("mason").setup({
            registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
        })
        require("mason-lspconfig").setup()
        require("roslyn").setup()

        vim.keymap.set("n", "<leader>R", "<cmd>Roslyn restart<cr>")
    end,
    dependencies = {
        { src = "https://github.com/seblyng/roslyn.nvim" },
        { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
        { src = "https://github.com/williamboman/mason.nvim" },
    },
}
