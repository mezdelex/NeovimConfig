---@class Utils.Pack.Spec : vim.pack.Spec
---@field config function?
---@field defer boolean?
---@field dependencies Utils.Pack.Spec[]?

local cached_specs, cached_names ---@type Utils.Pack.Spec[], string[]
local pack = {
	add_options = { confirm = false }, ---@type vim.pack.keyset.add
	update_options = { force = true }, ---@type vim.pack.keyset.update
}
local utils_profiler = require("utils.profiler")
local utils_shared = require("utils.shared")

---@private
---@return Utils.Pack.Spec[], string[]
local function get_specs_and_names()
	if cached_specs and cached_names then
		return cached_specs, cached_names
	end

	local plugin_files = vim.fn.glob(utils_shared.config_path .. "/lua/plugins/*.lua", true, true) ---@type string[]
	local specs, names = {}, {} ---@type Utils.Pack.Spec[], string[]

	for _, file in ipairs(plugin_files) do
		local plugin_name = vim.fn.fnamemodify(file, ":t:r")
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
	cached_specs, cached_names = specs, names

	return specs, names
end

---@private
---@param spec Utils.Pack.Spec
local function handle_build(spec)
	if not spec.data or spec.data.build:is_null_or_whitespace() then
		return
	end

	local plugin_name = vim.fn.fnamemodify(spec.src, ":t")
	local package_path = utils_shared.data_path .. "/site/pack/core/opt/" .. plugin_name ---@type string

	vim.notify(("Building %s..."):format(plugin_name), vim.log.levels.WARN)
	local response = vim.system(vim.split(spec.data.build, " "), { cwd = package_path }):wait()
	vim.notify(
		(
			(
				not response.stderr:is_null_or_whitespace() and response.stderr
				or not response.stdout:is_null_or_whitespace() and response.stdout
				or ("Exit code: %d"):format(response.code)
			)
		):trim(),
		response.code ~= 0 and vim.log.levels.ERROR or vim.log.levels.INFO
	)
end

local M = {} ---@class Utils.Pack

---@param specs Utils.Pack.Spec[]?
M.build = function(specs)
	if not specs or #specs == 0 then
		specs, _ = get_specs_and_names()
	end

	for _, spec in ipairs(specs) do
		handle_build(spec)
	end
end
M.load = function()
	local specs, _ = get_specs_and_names()

	vim.pack.add(specs, pack.add_options)
	for _, spec in ipairs(specs) do
		if spec.config then
			if spec.defer then
				vim.schedule(spec.config)
			elseif vim.g.start_time then
				utils_profiler.time_to_interaction(spec)
			else
				spec.config()
			end
		end
	end
end
M.update = function()
	local _, names = get_specs_and_names()

	vim.pack.update(names, pack.update_options)
end

return M
