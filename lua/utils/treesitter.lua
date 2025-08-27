---@class Utils.Treesitter.TextObject.Move
---@field goto_previous_start fun(rhs: string, group: string)
---@field goto_previous_end fun(rhs: string, group: string)
---@field goto_next_start fun(rhs: string, group: string)
---@field goto_next_end fun(rhs: string, group: string)

---@class Utils.Treesitter.TextObject.Select
---@field select_textobject fun(rhs: string, group: string)

local textobjects = {
    group = "textobjects",
    mode = { "n", "o", "x" },
}

---@class Utils.Treesitter
M = {
    ---@param lhs string
    ---@param to_move Utils.Treesitter.TextObject.Move
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
    ---@param to_select Utils.Treesitter.TextObject.Select
    ---@param rhs string
    to_select_mapper = function(lhs, to_select, rhs)
        vim.keymap.set(textobjects.mode, lhs, function()
            to_select.select_textobject(rhs, textobjects.group)
        end)
    end,
}

return M
