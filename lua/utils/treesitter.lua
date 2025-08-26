local textobjects = {
    group = "textobjects",
    mode = { "n", "o", "x" },
}

M = {
    ---@param lhs string
    ---@param to_move TSTextObjects.Config.Move
    ---@param rhs string
    to_move_mapper = function(lhs, to_move, rhs)
        vim.keymap.set(textobjects.mode, "[" .. lhs, function()
            to_move.goto_previous_start(rhs, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode, "[" .. string.upper(lhs), function()
            to_move.goto_previous_end(rhs, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode, "]" .. lhs, function()
            to_move.goto_next_start(rhs, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode, "]" .. string.upper(lhs), function()
            to_move.goto_next_end(rhs, textobjects.group)
        end)
    end,
    ---@param lhs string
    ---@param to_select TSTextObjects.Config.Select
    ---@param rhs string
    to_select_mapper = function(lhs, to_select, rhs)
        vim.keymap.set(textobjects.mode, lhs, function()
            to_select.select_textobject(rhs, textobjects.group)
        end)
    end,
}

return M
