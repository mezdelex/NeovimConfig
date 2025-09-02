---@param self string
---@return boolean
string.is_empty_or_whitespace = function(self)
	return self:match("^%s*$")
end
---@param self string
---@return string, number
string.trim = function(self)
	return self:gsub("^%s*(.-)%s*$", "%1")
end
