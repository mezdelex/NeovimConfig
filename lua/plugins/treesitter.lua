return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function()
        local options = { remap = true }
        local textobjects = {
            ci = "@class.inner",
            co = "@class.outer",
            fi = "@function.inner",
            fo = "@function.outer",
            ii = "@conditional.inner",
            io = "@conditional.outer",
            li = "@loop.inner",
            lo = "@loop.outer",
        }
        local ts = require("utils.treesitter")
        local to_move = require("nvim-treesitter-textobjects.move")
        local to_select = require("nvim-treesitter-textobjects.select")

        ts.to_move_mapper("c", to_move, textobjects.co)
        ts.to_move_mapper("f", to_move, textobjects.fo)
        ts.to_move_mapper("i", to_move, textobjects.io)
        ts.to_move_mapper("l", to_move, textobjects.lo)
        ts.to_select_mapper("ac", to_select, textobjects.co)
        ts.to_select_mapper("af", to_select, textobjects.fo)
        ts.to_select_mapper("ai", to_select, textobjects.io)
        ts.to_select_mapper("al", to_select, textobjects.lo)
        ts.to_select_mapper("ic", to_select, textobjects.ci)
        ts.to_select_mapper("if", to_select, textobjects.fi)
        ts.to_select_mapper("ii", to_select, textobjects.ii)
        ts.to_select_mapper("il", to_select, textobjects.li)
        vim.keymap.set("n", "<a-/>", "gcc", options)
        vim.keymap.set("v", "<a-/>", "gc", options)
    end,
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
}
