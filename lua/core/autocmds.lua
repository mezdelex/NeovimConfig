vim.api.nvim_create_augroup("init", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "<a-f>", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	end,
	group = "init",
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
	group = "init",
})
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("clearjumps")
	end,
	group = "init",
})
