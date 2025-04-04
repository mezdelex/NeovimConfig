return {
	"folke/snacks.nvim",
	config = function()
		local snacks = require("snacks")

		vim.keymap.set("n", "<leader>F", snacks.picker.grep)
		vim.keymap.set("n", "<leader>d", snacks.picker.diagnostics)
		vim.keymap.set("n", "<leader>f", snacks.picker.files)
		vim.keymap.set("n", "<leader>j", snacks.picker.jumps)
		vim.keymap.set("n", "<leader>q", snacks.picker.qflist)
		vim.keymap.set("n", "<leader>s", snacks.picker.lsp_symbols)
		vim.keymap.set({ "n", "v" }, "gs", snacks.picker.grep_word)
	end,
}
