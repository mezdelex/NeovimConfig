---@param this string?
---@return boolean
string.is_null_or_whitespace = function(this)
	return not this or this:match("^%s*$") ~= nil
end
---@param this string
---@return string
string.trim = function(this)
	return (this:gsub("^%s*(.-)%s*$", "%1"))
end
