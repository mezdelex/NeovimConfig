return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_config = {
					height = vim.o.lines,
					width = vim.o.columns,
				},
				layout_strategy = "vertical",
				path_display = { "truncate" },
			},
			extensions = {
				frecency = {
					db_safe_mode = false,
					matcher = "fuzzy",
					show_filter_column = false,
				},
			},
		})
		telescope.load_extension("frecency")

		vim.keymap.set("n", "<leader>F", builtin.live_grep)
		vim.keymap.set("n", "<leader>d", builtin.diagnostics)
		vim.keymap.set("n", "<leader>f", function()
			vim.cmd("FrecencyValidate!")
			telescope.extensions.frecency.frecency({ workspace = "CWD" })
		end)
		vim.keymap.set("n", "<leader>j", builtin.jumplist)
		vim.keymap.set("n", "<leader>q", builtin.quickfix)
		vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
		vim.keymap.set({ "n", "v" }, "gs", builtin.grep_string)
	end,
	dependencies = { "nvim-telescope/telescope-frecency.nvim" },
}
