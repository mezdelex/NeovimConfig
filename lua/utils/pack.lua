---@class Utils.Pack.Spec : vim.pack.Spec
---@field config function?
---@field dependencies Utils.Pack.Spec[]?

local pack = {
	---@type vim.pack.keyset.add
	add_options = { confirm = false },
	---@type vim.pack.keyset.update
	update_options = { force = true },
}
---@type Utils.Pack.Spec[], string[]
local cached_specs, cached_names
local utils_shared = require("utils.shared")

---@return Utils.Pack.Spec[], string[]
local function get_specs_and_names()
	if cached_specs and cached_names then
		return cached_specs, cached_names
	end

	---@type string[]
	local plugin_files = vim.fn.glob(utils_shared.config_path .. "/lua/plugins/*.lua", true, true)
	---@type Utils.Pack.Spec[], string[]
	local specs, names = {}, {}

	for _, file in ipairs(plugin_files) do
		local plugin_name = vim.fn.fnamemodify(file, ":t:r")
		---@type Utils.Pack.Spec
		local spec = require("plugins." .. plugin_name)

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

---@param spec Utils.Pack.Spec
local function handle_build(spec)
	if not spec.data or utils_shared.is_null_or_whitespace(spec.data.build) then
		return
	end

	local plugin_name = vim.fn.fnamemodify(spec.src, ":t")
	---@type string
	local plugin_path = utils_shared.data_path .. utils_shared.pack_path .. plugin_name

	vim.notify("Building " .. plugin_name .. "...", vim.log.levels.WARN)
	local response = vim.system(vim.split(spec.data.build, " "), { cwd = plugin_path }):wait()
	vim.notify(
		utils_shared.trim(
			(
				not utils_shared.is_null_or_whitespace(response.stderr) and response.stderr
				or not utils_shared.is_null_or_whitespace(response.stdout) and response.stdout
				or "exit code: " .. string(response.code)
			)
		),
		response.code ~= 0 and vim.log.levels.ERROR or vim.log.levels.INFO
	)
end

---@class Utils.Pack
local M = {
	---@param specs Utils.Pack.Spec[]?
	build = function(specs)
		if not specs or #specs == 0 then
			specs, _ = get_specs_and_names()
		end

		for _, spec in ipairs(specs) do
			handle_build(spec)
		end
	end,
	load = function()
		local specs, _ = get_specs_and_names()

		vim.pack.add(specs, pack.add_options)
		for _, spec in ipairs(specs) do
			if spec.config then
				spec.config()
			end
		end
	end,
	update = function()
		local _, names = get_specs_and_names()

		vim.pack.update(names, pack.update_options)
	end,
}

return M
