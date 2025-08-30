---@class Utils.Shared
local M = {
	config_path = vim.fn.stdpath("config"),
	data_path = vim.fn.stdpath("data"),
	pack_path = "/site/pack/core/opt/",

	---@param s string?
	---@return boolean
	is_null_or_whitespace = function(s)
		return not s or s:match("^%s*$") ~= nil
	end,
	---@param s string
	---@return string
	trim = function(s)
		return (s:gsub("^%s*(.-)%s*$", "%1"))
	end,
}

return M
