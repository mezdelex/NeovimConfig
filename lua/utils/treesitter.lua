M = {
    ---@param modes string[]
    ---@param lhs string
    ---@param ts_select table
    ---@param rhs string
    ---@param group string
    ts_select_mapper = function(modes, lhs, ts_select, rhs, group)
        vim.keymap.set(modes, lhs, function()
            ts_select.select_textobject(rhs, group)
        end)
    end,
    ---@param modes string[]
    ---@param lhs string
    ---@param ts_move table
    ---@param rhs string
    ---@param group string
    ts_move_mapper = function(modes, lhs, ts_move, rhs, group)
        vim.keymap.set(modes, "[" .. lhs, function()
            ts_move.goto_previous_start(rhs, group)
        end)
        vim.keymap.set(modes, "[" .. string.upper(lhs), function()
            ts_move.goto_previous_end(rhs, group)
        end)
        vim.keymap.set(modes, "]" .. lhs, function()
            ts_move.goto_next_start(rhs, group)
        end)
        vim.keymap.set(modes, "]" .. string.upper(lhs), function()
            ts_move.goto_next_end(rhs, group)
        end)
    end,
}

return M
