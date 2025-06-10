return {
	"neovim/nvim-lspconfig",
	config = function()
		require("mason").setup({
			registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
		})
		require("mason-lspconfig").setup()
		require("roslyn").setup()

		require("blink.cmp").setup({
			completion = {
				documentation = { auto_show = true },
			},
			keymap = { preset = "enter" },
		})

		vim.diagnostic.config({
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
	dependencies = {
		"seblyng/roslyn.nvim",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		{ "saghen/blink.cmp", build = "cargo build --release" },
	},
}
