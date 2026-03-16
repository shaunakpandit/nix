vim.pack.add({
	{ src = "https://github.com/chentoast/marks.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/julianolf/nvim-dap-lldb" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
})

require("dap-lldb").setup()
local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set({ "n" }, "<Leader>d", ":DapNew<CR>")
vim.keymap.set({ "n", "i" }, "<C-b>", ":DapToggleBreakpoint<CR>")
require("marks").setup({
	builtin_marks = { "<", ">", "^" },
})
