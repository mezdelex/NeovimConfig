return {
	"OXY2DEV/markview.nvim",
	config = function()
		local options = { silent = true }

		require("markview").setup()

		vim.keymap.set("n", "<leader>m", ":Markview<cr>", options)
	end,
}
