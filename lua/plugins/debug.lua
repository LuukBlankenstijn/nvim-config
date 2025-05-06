return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text", -- Optional, shows variable values as virtual text
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- DAP UI setup
			dapui.setup()

			-- Automatically open/close the DAP UI when debugging starts/ends
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Go specific setup
			require("dap-go").setup()

			-- Key mappings (LazyVim usually uses <leader>d for debug)
			vim.keymap.set("n", "<leader>db", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Conditional Breakpoint" })
			vim.keymap.set("n", "<leader>dc", function()
				require("dap").continue()
			end, { desc = "Continue" })
			vim.keymap.set("n", "<leader>dC", function()
				require("dap").run_to_cursor()
			end, { desc = "Run to Cursor" })
			vim.keymap.set("n", "<leader>do", function()
				require("dap").step_over()
			end, { desc = "Step Over" })
			vim.keymap.set("n", "<leader>di", function()
				require("dap").step_into()
			end, { desc = "Step Into" })
			vim.keymap.set("n", "<leader>dO", function()
				require("dap").step_out()
			end, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>dt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug Go Test" })
			vim.keymap.set("n", "<leader>dr", function()
				require("dap").repl.open()
			end, { desc = "Open REPL" })
			vim.keymap.set("n", "<leader>du", function()
				require("dapui").toggle()
			end, { desc = "Toggle UI" })
			vim.keymap.set("n", "<leader>dx", function()
				require("dap").terminate()
			end, { desc = "Terminate" })
		end,
	},
}
