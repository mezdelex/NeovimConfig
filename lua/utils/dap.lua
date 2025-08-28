---@class Utils.Dap
M = {
	---@param base_paths string[]
	---@return string
	find_build_dir = function(base_paths)
		local cwd = vim.fn.getcwd()
		---@type string[]
		local build_dirs = vim.tbl_map(function(path)
			return cwd .. path
		end, base_paths)
		local latest_file, latest_time = nil, 0

		local function scan_dir(dir)
			local fd = vim.uv.fs_scandir(dir)
			if not fd then
				return
			end

			while true do
				local name, t = vim.uv.fs_scandir_next(fd)
				if not name then
					break
				end

				local path = dir .. "/" .. name
				if t == "directory" then
					scan_dir(path)
				elseif (name:match("%.dll$") or name:match("%.exe$")) and not name:match("^System") then
					local st = vim.uv.fs_stat(path)
					if st and st.mtime.sec > latest_time then
						latest_file, latest_time = path, st.mtime.sec
					end
				end
			end
		end

		for _, dir in ipairs(build_dirs) do
			scan_dir(dir)
		end

		return latest_file and latest_file:match("(.*/)[^/]+$") or cwd
	end,
}

return M
