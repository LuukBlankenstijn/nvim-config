return {
	"phpactor/phpactor",
	build = "composer install --no-dev -o",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>pc", ":PhpactorContextMenu<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pg", ":PhpactorGenerateAccessors<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ps", ":PhpactorGenerateMutators<CR>", { noremap = true, silent = true })
	end,
}
