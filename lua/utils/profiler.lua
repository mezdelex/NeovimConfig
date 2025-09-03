local M = {} ---@class Utils.Profiler

---@param spec Utils.Pack.Spec
M.profile = function(spec)
	local started = (vim.uv.hrtime() - vim.g.start_time) / 1e6
	vim.notify(("%s started at: %.2fms"):format(spec.name or spec.src, started), vim.log.levels.TRACE)

	spec.config()

	local ended = (vim.uv.hrtime() - vim.g.start_time) / 1e6
	vim.notify(("%s ended at: %.2fms"):format(spec.name or spec.src, ended), vim.log.levels.TRACE)
	vim.notify(("%s took: %.2fms"):format(spec.name or spec.src, ended - started), vim.log.levels.TRACE)
end

return M
