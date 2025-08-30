---@type Utils.Pack.Spec
return {
	config = function()
		local null = require("null-ls")

		null.setup({
			sources = {
				null.builtins.formatting.csharpier,
				null.builtins.formatting.prettier,
				null.builtins.formatting.shfmt,
				null.builtins.formatting.sql_formatter,
				null.builtins.formatting.stylua,
			},
		})
	end,
	src = "https://github.com/nvimtools/none-ls.nvim",
}
