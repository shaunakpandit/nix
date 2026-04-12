vim.pack.add({ { src = "https://github.com/joryeugene/dadbod-grip.nvim" } })

require("dadbod-grip").setup({ keymaps = {
	qpad_execute = "<C-e",
} })

local keymap = vim.keymap

keymap.set("n", "<leader>db", "<cmd>GripToggle<cr>", { desc = "DB connect" })
keymap.set("n", "<leader>dg", "<cmd>Grip<cr>", { desc = "DB grid" })
-- keymap.set("n", "<leader>dt", "<cmd>GripTables<cr>", { desc = "DB tables" })
-- keymap.set("n", "<leader>dq", "<cmd>GripQuery<cr>", { desc = "DB query pad" })
-- keymap.set("n", "<leader>ds", "<cmd>GripSchema<cr>", { desc = "DB schema" })
-- keymap.set("n", "<leader>dh", "<cmd>GripHistory<cr>", { desc = "DB history" })

-- mysql://mluser:mlpassword@192.168.4.28:33061/musicleague
-- mysql://root:admin123@127.0.0.1:3306/testlit_new
-- mysql://root:admin123@127.0.0.1:3306/logging
