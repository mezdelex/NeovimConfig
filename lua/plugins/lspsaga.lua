return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			lightbulb = { virtual_text = false },
			ui = {
				border = "rounded",
				code_action = "",
			},
		})

		vim.keymap.set("n", "<leader>.", ":Lspsaga code_action<cr>")
		vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>")
		vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<cr>")
	end,
}
