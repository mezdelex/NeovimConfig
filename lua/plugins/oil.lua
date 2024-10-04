return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			cleanup_delay_ms = 250,
			view_options = { show_hidden = true },
		})
		require("lsp-file-operations").setup()

		vim.keymap.set("n", "<leader>o", ":Oil<cr>")
	end,
	dependencies = { "antosha417/nvim-lsp-file-operations" },
}
