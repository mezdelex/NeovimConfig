---@class Utils.Treesitter.TextObject.Move
---@field goto_previous_start fun(query: string, group: string)
---@field goto_previous_end fun(query: string, group: string)
---@field goto_next_start fun(query: string, group: string)
---@field goto_next_end fun(query: string, group: string)

---@class Utils.Treesitter.TextObject.Repeatable
---@field repeat_last_move_opposite fun()
---@field repeat_last_move fun(opts: TSTextObjects.MoveOpts?)
---@field builtin_F_expr fun()
---@field builtin_T_expr fun()
---@field builtin_f_expr fun()
---@field builtin_t_expr fun()

---@class Utils.Treesitter.TextObject.Select
---@field select_textobject fun(query: string, group: string)

local textobjects = {
    group = "textobjects",
    mode_nox = { "n", "o", "x" },
    mode_ox = { "o", "x" },
    options = { expr = true },
}

---@see https://github.com/nvim-treesitter/nvim-treesitter-textobjects/pull/795
---@param func function
---@return string?
function Provisional(func)
    local response = func()

    return response and vim.api.nvim_feedkeys(vim.v.count1 .. response, "n", true)
end

---@class Utils.Treesitter
M = {
    ---@param lhs string
    ---@param to_move Utils.Treesitter.TextObject.Move
    ---@param query string
    to_move_mapper = function(lhs, to_move, query)
        vim.keymap.set(textobjects.mode_nox, "[" .. lhs, function()
            to_move.goto_previous_start(query, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode_nox, "[" .. string.upper(lhs), function()
            to_move.goto_previous_end(query, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode_nox, "]" .. lhs, function()
            to_move.goto_next_start(query, textobjects.group)
        end)
        vim.keymap.set(textobjects.mode_nox, "]" .. string.upper(lhs), function()
            to_move.goto_next_end(query, textobjects.group)
        end)
    end,
    ---@param to_repeatable Utils.Treesitter.TextObject.Repeatable
    to_repeatable_mapper = function(to_repeatable)
        vim.keymap.set(textobjects.mode_nox, ",", function()
            Provisional(to_repeatable.repeat_last_move_opposite)
        end)
        vim.keymap.set(textobjects.mode_nox, ";", function()
            Provisional(to_repeatable.repeat_last_move)
        end)
        vim.keymap.set(textobjects.mode_nox, "F", to_repeatable.builtin_F_expr, textobjects.options)
        vim.keymap.set(textobjects.mode_nox, "T", to_repeatable.builtin_T_expr, textobjects.options)
        vim.keymap.set(textobjects.mode_nox, "f", to_repeatable.builtin_f_expr, textobjects.options)
        vim.keymap.set(textobjects.mode_nox, "t", to_repeatable.builtin_t_expr, textobjects.options)
    end,
    ---@param lhs string
    ---@param to_select Utils.Treesitter.TextObject.Select
    ---@param query string
    to_select_mapper = function(lhs, to_select, query)
        vim.keymap.set(textobjects.mode_ox, lhs, function()
            to_select.select_textobject(query, textobjects.group)
        end)
    end,
}

return M
