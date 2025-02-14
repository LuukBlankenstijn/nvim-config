return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			php = { "phpcs_custom" }, -- Use a custom `phpcs` linter
		},
		linters = {
			phpcs_custom = {
				command = "phpcs",
				args = function()
					-- Define possible config files
					local config_files = { ".phpcs.xml", "phpcs.xml", "phpcs.xml.dist" }
					-- Check if any of them exist in the working directory
					for _, file in ipairs(config_files) do
						if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
							return { "--standard=" .. file }
						end
					end
					-- Return an empty args table if no config file is found
					return {}
				end,
				stdin = false,
			},
		},
	},
}
