vim.pack.add({
	{ src = "https://github.com/gbprod/yanky.nvim" },
})

require("yanky").setup({
	ring = {
		history_length = 100,
		storage = "shada",
		sync_with_numbered_registers = true,
		cancel_event = "update",
		ignore_registers = { "_" },
		update_register_on_cycle = false,
		permanent_wrapper = nil,
	},
	system_clipboard = {
		sync_with_ring = true,
	},
})

local keymap = vim.keymap
-- YANKY
keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
