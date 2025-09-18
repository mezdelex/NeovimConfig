local M = {} ---@class Utils.Diagnostic

---@param count number
M.jump = function(count)
    vim.diagnostic.jump({
        count = count,
        on_jump = function()
            vim.diagnostic.open_float({ scope = "line" })
        end,
    })
end

return M
