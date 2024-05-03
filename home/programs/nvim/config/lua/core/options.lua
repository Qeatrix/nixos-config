local options = {
	shiftwidth=4
}

for name, value in pairs(options) do
	local ok,_ = pcall(vim.api.nvim_get_option_info2, name, {})

	if ok then
		vim.opt[name] = value
	else
		vim.notify("Option " ..name .." is not supported", vim.log.levels.WARN)
	end
end
