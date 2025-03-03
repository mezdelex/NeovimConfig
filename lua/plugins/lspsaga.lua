return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local options = { silent = true }

		require("lspsaga").setup({
			lightbulb = { virtual_text = false },
			ui = {
				border = "rounded",
				code_action = "",
			},
		})

		vim.keymap.set("n", "<leader>.", ":Lspsaga code_action<cr>", options)
		vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", options)
		vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", options)
	end,
}
