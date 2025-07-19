return {
	"olimorris/codecompanion.nvim",
	config = function()
		local codecompanion = require("codecompanion")

		codecompanion.setup({
			strategies = {
				chat = { adapter = "gemini" },
			},
		})

		vim.keymap.set("n", "<leader>h", codecompanion.chat)
	end,
}
