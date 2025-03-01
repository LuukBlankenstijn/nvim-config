return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	keys = {
		{
			"<leader>ogd",
			function()
				vim.cmd("DiffviewOpen")
			end,
			desc = "Open Git Diff View",
		},
		{
			"<leader>ogh",
			function()
				vim.cmd("DiffviewFileHistory %")
			end,
			desc = "File History",
		},
		{
			"<leader>cgd",
			function()
				vim.cmd("DiffviewClose")
			end,
			desc = "Close Git Diff View",
		},
	},
	opts = {},
}
