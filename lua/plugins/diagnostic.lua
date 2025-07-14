return {
	"rachartier/tiny-inline-diagnostic.nvim",
	config = function()
		vim.diagnostic.config({
			signs = {
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				},
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.WARN] = "",
				},
			},
		})

		require("tiny-inline-diagnostic").setup({
			options = {
				enable_on_insert = true,
				overflow = {
					mode = "wrap",
					padding = 2,
				},
				throttle = 0,
				use_icons_from_diagnostic = true,
			},
			signs = {
				arrow = " ",
				diag = "",
				left = "",
				right = "",
				up_arrow = " ",
				vertical = " │",
				vertical_end = " └",
			},
		})
	end,
}
