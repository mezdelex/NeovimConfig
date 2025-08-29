---@class Utils.Pack.Spec : vim.pack.Spec
---@field build string?
---@field config function?
---@field dependencies Utils.Pack.Spec[]?

local pack = {
	---@type vim.pack.keyset.add
	add_options = { confirm = false },
	---@type vim.pack.keyset.update
	update_options = { force = true },
}
---@type Utils.Pack.Spec[], string[]
local cached_plugins, cached_names
local utils_shared = require("utils.shared")

---@return Utils.Pack.Spec[], string[]
local function get_plugins_and_names()
	if cached_plugins and cached_names then
		return cached_plugins, cached_names
	end

	---@type string[]
	local plugin_files = vim.fn.glob(utils_shared.config_path .. "/lua/plugins/*.lua", true, true)
	---@type Utils.Pack.Spec[]
	local plugins = {}
	---@type string[]
	local names = {}

	for _, file in ipairs(plugin_files) do
		local plugin_name = vim.fn.fnamemodify(file, ":t:r")
		---@type Utils.Pack.Spec
		local spec = require("plugins." .. plugin_name)

		if spec.dependencies then
			for _, dep in ipairs(spec.dependencies) do
				plugins[#plugins + 1] = dep
				names[#names + 1] = vim.fn.fnamemodify(dep.src, ":t")
			end
		end
		plugins[#plugins + 1] = spec
		names[#names + 1] = vim.fn.fnamemodify(spec.src, ":t")
	end
	cached_plugins, cached_names = plugins, names

	return plugins, names
end

---@param plugin Utils.Pack.Spec
local function handle_build(plugin)
	if plugin.build then
		local plugin_name = vim.fn.fnamemodify(plugin.src, ":t")
		---@type string
		local plugin_path = utils_shared.data_path .. "/site/pack/core/opt/" .. plugin_name

		vim.notify("Building " .. plugin_name .. "...", vim.log.levels.WARN)
		local response = vim.system(vim.split(plugin.build, " "), { cwd = plugin_path }):wait()
		vim.notify(
			utils_shared.trim(
				(
					not utils_shared.is_empty(response.stderr) and response.stderr
					or not utils_shared.is_empty(response.stdout) and response.stdout
					or "exit code: " .. string(response.code)
				)
			),
			response.code ~= 0 and vim.log.levels.ERROR or vim.log.levels.INFO
		)
	end
end

---@class Utils.Pack
local M = {
	build = function()
		local plugins, _ = get_plugins_and_names()
		for _, plugin in ipairs(plugins) do
			handle_build(plugin)
		end
	end,
	load = function()
		local plugins, _ = get_plugins_and_names()
		vim.pack.add(plugins, pack.add_options)
		for _, plugin in ipairs(plugins) do
			if plugin.config then
				plugin.config()
			end
		end
	end,
	update = function()
		local _, names = get_plugins_and_names()
		vim.pack.update(names, pack.update_options)
	end,
}

return M
