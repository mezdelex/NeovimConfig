---@type Utils.Pack.Spec
return {
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			current_line_blame = true,
			current_line_blame_formatter = "<author> <author_time:%Y-%m-%d> <summary>",
		})

		vim.keymap.set("n", "<leader>g", gitsigns.blame)
	end,
	defer = true,
	src = "https://github.com/lewis6991/gitsigns.nvim",
}
