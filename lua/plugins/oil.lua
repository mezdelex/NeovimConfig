return {
	"stevearc/oil.nvim",
	config = function()
		local opts = {
			silent = true,
		}

		require("oil").setup({
			cleanup_delay_ms = 250,
			view_options = {
				show_hidden = true,
			},
		})
		require("lsp-file-operations").setup()

		vim.keymap.set("n", "<leader>o", ":Oil<cr>", opts)
	end,
	dependencies = {
		"antosha417/nvim-lsp-file-operations",
	},
}
