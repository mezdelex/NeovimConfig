---@class Utils.Pack.Spec : vim.pack.Spec
---@field build string?
---@field config function?
---@field dependencies Utils.Pack.Spec[]?

local pack = {
	---@type vim.pack.keyset.add
	add_options = { confirm = false },
	---@type vim.pack.keyset.update
	update_options = { force = true },
	pattern = "[^/]+$",
}

---@return Utils.Pack.Spec[], string[]
local function get_plugins_and_names()
	---@type string[]
	local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", true, true)
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
				table.insert(plugins, dep)
				table.insert(names, string.match(dep.src, pack.pattern))
			end
		end
		table.insert(plugins, spec)
		table.insert(names, string.match(spec.src, pack.pattern))
	end

	return plugins, names
end

---@param plugin Utils.Pack.Spec
---@param current_dir string
local function handle_build(plugin, current_dir)
	if plugin.build then
		local plugin_name = string.match(plugin.src, pack.pattern)
		---@type string
		local plugin_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/" .. plugin_name

		vim.fn.chdir(plugin_path)
		vim.notify("Building " .. plugin_name .. "...", vim.log.levels.WARN)
		vim.notify(vim.fn.system(plugin.build):gsub("^%s*(.-)%s*$", "%1"), vim.log.levels.INFO)
		vim.fn.chdir(current_dir)
	end
end

---@class Utils.Pack
M = {
	build = function()
		local plugins, _ = get_plugins_and_names()
		local current_dir = vim.fn.getcwd()
		for _, plugin in ipairs(plugins) do
			handle_build(plugin, current_dir)
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
