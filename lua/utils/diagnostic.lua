---@private
local winid = nil ---@type number?

local M = {} ---@class Utils.Diagnostic

---@param count number
M.jump = function(count)
    vim.diagnostic.jump({
        count = count,
        on_jump = function()
            if winid and vim.api.nvim_win_is_valid(winid) then
                vim.api.nvim_win_close(winid, true)
            end

            _, winid = vim.diagnostic.open_float({ scope = "cursor" })
        end,
    })
end

return M
