---@class Utils.Pack.Spec : vim.pack.Spec
---@field config? fun()
---@field defer? boolean
---@field dependencies? Utils.Pack.Spec[]

local pack = {
	add_options = { confirm = false }, ---@type vim.pack.keyset.add
	packages_rpath = "/site/pack/core/opt/",
	plugins_rpath = "/lua/plugins/",
	update_options = { force = true }, ---@type vim.pack.keyset.update
}
local utils_profiler = require("utils.profiler")
local utils_shared = require("utils.shared")

---@private
---@return Utils.Pack.Spec[], string[]
local function get_specs_and_names()
	local plugin_fpaths = vim.fn.glob(utils_shared.config_path .. pack.plugins_rpath .. "*.lua", true, true) ---@type string[]
	local specs, names = {}, {} ---@type Utils.Pack.Spec[], string[]

	for _, plugin_fpath in ipairs(plugin_fpaths) do
		local plugin_name = vim.fn.fnamemodify(plugin_fpath, ":t:r")
		local spec = require("plugins." .. plugin_name) ---@type Utils.Pack.Spec

		if spec.dependencies then
			for _, dep in ipairs(spec.dependencies) do
				specs[#specs + 1] = dep
				names[#names + 1] = vim.fn.fnamemodify(dep.src, ":t")
			end
		end
		specs[#specs + 1] = spec
		names[#names + 1] = vim.fn.fnamemodify(spec.src, ":t")
	end

	return specs, names
end

---@private
---@return string[]
local function get_package_names()
	local package_fpaths = vim.fn.glob(utils_shared.data_path .. pack.packages_rpath .. "*/", false, true) ---@type string[]
	local package_names = {} ---@type string[]

	for _, package_fpath in ipairs(package_fpaths) do
		local package_name = vim.fn.fnamemodify(package_fpath:sub(1, -2), ":t")

		package_names[#package_names + 1] = package_name
	end

	return package_names
end

---@private
---@param spec Utils.Pack.Spec
local function handle_build(spec)
	if
		not spec.data
		or not spec.data.build
		or not type(spec.data.build) == "string"
		or spec.data.build:is_empty_or_whitespace()
	then
		return
	end

	local package_name = vim.fn.fnamemodify(spec.src, ":t")
	local package_fpath = utils_shared.data_path .. pack.packages_rpath .. package_name ---@type string
	local stat = vim.uv.fs_stat(package_fpath)

	if not stat or not stat.type == "directory" then
		return
	end

	vim.notify(("Building %s..."):format(package_name), vim.log.levels.WARN)
	local response = vim.system(vim.split(spec.data.build, " "), { cwd = package_fpath }):wait()
	vim.notify(
		(
			response.stderr and not response.stderr:is_empty_or_whitespace() and response.stderr
			or response.stdout and not response.stdout:is_empty_or_whitespace() and response.stdout
			or ("Exit code: %d"):format(response.code)
		):trim(),
		response.code ~= 0 and vim.log.levels.ERROR or vim.log.levels.INFO
	)
end

local M = {} ---@class Utils.Pack

---@param specs? Utils.Pack.Spec[]
M.build = function(specs)
	if not specs or #specs == 0 then
		specs, _ = get_specs_and_names()
	end

	for _, spec in ipairs(specs) do
		handle_build(spec)
	end
end
M.clean = function()
	local _, names = get_specs_and_names()
	local package_names = get_package_names()
	local names_set, packages_to_delete = {}, {} ---@type table<string, boolean>, string[]

	for _, name in ipairs(names) do
		names_set[name] = true
	end

	for _, package_name in ipairs(package_names) do
		if not names_set[package_name] then
			packages_to_delete[#packages_to_delete + 1] = package_name
		end
	end

	vim.pack.del(packages_to_delete)
end
M.load = function()
	local specs, _ = get_specs_and_names()

	vim.pack.add(specs, pack.add_options)

	for _, spec in ipairs(specs) do
		if spec.config then
			if spec.defer then
				vim.schedule(spec.config)
			elseif vim.g.start_time then
				utils_profiler.profile(spec)
			else
				spec.config()
			end
		end
	end
end
M.update = function()
	vim.pack.update(nil, pack.update_options)
end

return M
