return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			phpcbf_gitmodified = {
				command = "phpcbf",
				args = { "-p", "--filter=GitModified" },
				stdin = false, -- phpcbf does not support stdin
			},
			clang_format = {
				command = "clang-format",
				args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
			},
		},
		formatters_by_ft = {
			php = { "phpcbf_gitmodified" },
			c = { "clang_format" },
		},
	},
}
