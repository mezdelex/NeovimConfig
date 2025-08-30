---@type Utils.Pack.Spec
return {
	config = function()
		local markview = require("markview")

		markview.setup({
			experimental = { check_rtp_message = false },
			preview = {
				filetypes = { "codecompanion", "markdown" },
				ignore_buftypes = {},
			},
		})

		vim.keymap.set("n", "<leader>m", markview.commands["toggle"])
	end,
	src = "https://github.com/OXY2DEV/markview.nvim",
}
