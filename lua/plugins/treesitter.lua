return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local options = {
			remap = true,
			silent = true,
		}

		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
		})
		require("ts_context_commentstring").setup({ enable_autocmd = false })
		vim.filetype.get_option = function(filetype, option)
			return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
				or vim.bo.commentstring
				or vim.filetype.get_option(filetype, option)
		end

		vim.keymap.set("n", "<a-/>", "gcc", options)
		vim.keymap.set("v", "<a-/>", "gc", options)
	end,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}
