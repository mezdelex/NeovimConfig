local autocmds = {
	---@type vim.api.keyset.create_augroup
	augroup_options = { clear = true },
	group = "Init",
}
local utils_pack = require("utils.pack")

vim.api.nvim_create_augroup(autocmds.group, autocmds.augroup_options)

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
	group = autocmds.group,
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		---@type vim.keymap.set.Opts
		local options = { buffer = args.buf }

		vim.keymap.set("n", "<a-f>", vim.lsp.buf.format, options)
		vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, options)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, options)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, options)
	end,
	group = autocmds.group,
})
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(args)
		---@type string
		local kind = args.data.kind

		if kind == "install" or kind == "update" then
			---@type Utils.Pack.Spec
			local spec = args.data.spec

			utils_pack.build({ spec })
		end
	end,
	group = autocmds.group,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
	group = autocmds.group,
})
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("clearjumps")
	end,
	group = autocmds.group,
})
