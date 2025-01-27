return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		opts.ensure_installed = vim.tbl_filter(function(item)
			return item ~= "phpcs"
		end, opts.ensure_installed or {})
	end,
}
