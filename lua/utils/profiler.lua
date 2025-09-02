local M = {} ---@class Utils.Profiler

---@param spec Utils.Pack.Spec
M.time_to_interaction = function(spec)
	spec.config()
	vim.notify(
		("Time to interaction for %s: %.2fms"):format(spec.name or spec.src, (vim.uv.hrtime() - vim.g.start_time) / 1e6),
		vim.log.levels.TRACE
	)
end

return M
