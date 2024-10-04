return {
	"tversteeg/registers.nvim",
	config = function()
		require("registers").setup({
			show_empty = false,
			window = {
				border = "rounded",
				transparency = 0,
			},
		})
	end,
}
