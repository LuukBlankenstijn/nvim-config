return {
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		keys = {
			{
				"<leader>cp",
				function()
					local peek = require("peek")
					if peek.is_open() then
						peek.close()
					else
						peek.open()
					end
				end,
				desc = "Markdown Preview",
			},
		},
		opts = {
			auto_load = true, -- automatically load preview when entering markdown buffer
			close_on_bdelete = true, -- close preview when buffer is deleted
			syntax = true, -- enable syntax highlighting
			theme = "dark", -- 'dark' or 'light'
			update_on_change = true, -- update preview on change
			app = "browser", -- 'webview', 'browser', executable
			filetype = { "markdown" }, -- list of filetypes to recognize as markdown
			-- relevant if using "runner" app
			throttle_at = 200000, -- start throttling when file exceeds this size (in bytes)
			throttle_time = "auto", -- minimum time in milliseconds between updates (default: 'auto' uses a logarithmic scale based on the throttle_at size)
		},
		init = function()
			-- Make sure we have deno installed
			vim.system({ "deno", "--version" }, { text = true }, function(obj)
				if obj.code ~= 0 then
					vim.notify("peek.nvim requires deno to be installed", vim.log.levels.ERROR)
				end
			end)
		end,
	},
}
