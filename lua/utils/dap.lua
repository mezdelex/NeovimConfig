---@param dir string
---@param latest_file string?
---@param latest_time number
---@return string?, number
local function scan_dir(dir, latest_file, latest_time)
	local fd = vim.uv.fs_scandir(dir)
	if not fd then
		return latest_file, latest_time
	end

	while true do
		local name, t = vim.uv.fs_scandir_next(fd)
		if not name then
			break
		end

		local path = dir .. "/" .. name
		if t == "directory" then
			latest_file, latest_time = scan_dir(path, latest_file, latest_time)
		elseif (name:match("%.dll$") or name:match("%.exe$")) and not name:match("^System") then
			local st = vim.uv.fs_stat(path)
			if st and st.mtime.sec > latest_time then
				latest_file, latest_time = path, st.mtime.sec
			end
		end
	end

	return latest_file, latest_time
end

local M = { ---@class Utils.Dap
	---@param base_paths string[]
	---@return string
	find_file_or_default = function(base_paths)
		local cwd = vim.fn.getcwd()
		local build_dirs = vim.tbl_map(function(path) ---@type string[]
			return cwd .. path
		end, base_paths)
		local latest_file, latest_time = nil, 0

		for _, dir in ipairs(build_dirs) do
			latest_file, latest_time = scan_dir(dir, latest_file, latest_time)
		end

		return latest_file or build_dirs[1]
	end,
}

return M
