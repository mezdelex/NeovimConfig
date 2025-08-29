vim.g.mapleader = " "

---@type vim.pack.keyset.add
local add_options = { confirm = false }
---@type vim.pack.keyset.update
local update_options = { force = true }
---@type string[]
local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", true, true)

for _, file in ipairs(plugin_files) do
	---@type string[]
	local names = {}
	local plugin_name = vim.fn.fnamemodify(file, ":t:r")
	---@type Utils.Pack.Spec[]
	local plugins = {}
	---@type Utils.Pack.Spec
	local spec = require("plugins." .. plugin_name)

	if spec.dependencies then
		for _, dep in ipairs(spec.dependencies) do
			table.insert(plugins, dep)
			-- table.insert(names, string.match(dep.src, "[^/]+$"))
		end
	end
	table.insert(plugins, spec)
	-- table.insert(names, string.match(spec.src, "[^/]+$"))

	vim.pack.add(plugins, add_options)
	--	vim.pack.update(names, update_options)

	for _, plugin in ipairs(plugins) do
		-- if plugin.build then
		-- 	local current_dir = vim.fn.getcwd()
		-- 	---@type string
		-- 	local plugin_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/" .. string.match(plugin.src, "[^/]+$")
		--
		-- 	vim.fn.chdir(plugin_path)
		-- 	vim.fn.system(plugin.build)
		-- 	vim.fn.chdir(current_dir)
		-- end
		if plugin.config then
			plugin.config()
		end
	end
end
