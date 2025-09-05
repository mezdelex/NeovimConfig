return {
	config = function()
		require("mason").setup({
			registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
		})
		require("mason-lspconfig").setup()
		require("roslyn").setup()

		vim.keymap.set("n", "<leader>R", "<cmd>Roslyn restart<cr>")
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
