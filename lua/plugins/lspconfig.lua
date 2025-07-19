return {
	"neovim/nvim-lspconfig",
	config = function()
		require("mason").setup({
			registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
		})
		require("mason-lspconfig").setup()
		require("roslyn").setup()

		vim.keymap.set("n", "<leader>R", "<cmd>Roslyn restart<cr>")
	end,
	dependencies = {
		"seblyng/roslyn.nvim",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
}
