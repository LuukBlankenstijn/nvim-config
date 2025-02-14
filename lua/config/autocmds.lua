vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "yaml", "json", "html", "css", "lua" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
