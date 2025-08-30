---@type Utils.Pack.Spec
return {
	config = function()
		local markdown = require("render-markdown")

		markdown.setup({
			file_types = { "codecompanion", "markdown" },
		})

		vim.keymap.set("n", "<leader>m", markdown.toggle)
	end,
	defer = true,
	src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
}
