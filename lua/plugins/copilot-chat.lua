return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		keys = {
			{
				"<leader>co",
				function()
					vim.cmd("CopilotChatToggle")
				end,
				desc = "Toggle Copilot Chat window",
			},
			{
				"<leader>chl",
				function()
					vim.cmd("CopilotChatLoad")
				end,
				desc = "Load Copilot Chat history",
			},
			{
				"<leader>chs",
				function()
					vim.cmd("CopilotChatSave")
				end,
				desc = "Save Copilot Chat history",
			},
			-- Visual-mode keymaps for actions on selected code:
			{
				"<leader>ce",
				function()
					vim.cmd("CopilotChatExplain")
				end,
				mode = "v",
				desc = "Explain selected code (Copilot Chat)",
			},
			{
				"<leader>cr",
				function()
					vim.cmd("CopilotChatReview")
				end,
				mode = "v",
				desc = "Review selected code (Copilot Chat)",
			},
			{
				"<leader>cd",
				function()
					vim.cmd("CopilotChatDocs")
				end,
				mode = "v",
				desc = "Generate docstring (Copilot Chat)",
			},
			{
				"<leader>ct",
				function()
					vim.cmd("CopilotChatTests")
				end,
				mode = "v",
				desc = "Generate tests (Copilot Chat)",
			},
		},
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.35,
				},
				sticky = {
					"#files",
				},
			}
		end,
	},
}
