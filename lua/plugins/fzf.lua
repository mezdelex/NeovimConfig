---@type Utils.Pack.Spec
return {
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			keymap = {
				fzf = {
					["alt-a"] = "toggle-all",
					["ctrl-q"] = "select-all+accept",
				},
			},
			winopts = {
				fullscreen = true,
				preview = {
					layout = "vertical",
					vertical = "up:70%",
				},
			},
		})

		vim.keymap.set("n", "<leader>F", fzf.live_grep)
		vim.keymap.set("n", "<leader>d", fzf.diagnostics_workspace)
		vim.keymap.set("n", "<leader>f", fzf.files)
		vim.keymap.set("n", "<leader>j", fzf.jumps)
		vim.keymap.set("n", "<leader>q", fzf.quickfix)
		vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols)
		vim.keymap.set("n", "gs", fzf.grep_cword)
		vim.keymap.set("x", "gs", fzf.grep_visual)
	end,
	src = "https://github.com/ibhagwan/fzf-lua",
}
