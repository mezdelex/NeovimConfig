return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	config = function()
		local options = { remap = true }
		local text_objects = {
			ci = "@class.inner",
			co = "@class.outer",
			fi = "@function.inner",
			fo = "@function.outer",
			ii = "@conditional.inner",
			io = "@conditional.outer",
			li = "@loop.inner",
			lo = "@loop.outer",
			to = "textobjects",
		}
		local ts = require("utils.treesitter")
		local ts_move = require("nvim-treesitter-textobjects.move")
		local ts_select = require("nvim-treesitter-textobjects.select")

		ts.ts_move_mapper({ "n", "o", "x" }, "c", ts_move, text_objects.co, text_objects.to)
		ts.ts_move_mapper({ "n", "o", "x" }, "f", ts_move, text_objects.fo, text_objects.to)
		ts.ts_move_mapper({ "n", "o", "x" }, "i", ts_move, text_objects.io, text_objects.to)
		ts.ts_move_mapper({ "n", "o", "x" }, "l", ts_move, text_objects.lo, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "ac", ts_select, text_objects.co, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "af", ts_select, text_objects.fo, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "ai", ts_select, text_objects.io, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "al", ts_select, text_objects.lo, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "ic", ts_select, text_objects.ci, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "if", ts_select, text_objects.fi, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "ii", ts_select, text_objects.ii, text_objects.to)
		ts.ts_select_mapper({ "n", "o", "x" }, "il", ts_select, text_objects.li, text_objects.to)
		vim.keymap.set("n", "<a-/>", "gcc", options)
		vim.keymap.set("v", "<a-/>", "gc", options)
	end,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	},
}
