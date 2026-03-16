vim.pack.add({
	"https://github.com/folke/flash.nvim",
})

-- config https://github.com/folke/flash.nvim
require("flash").setup({
	modes = {
		search = {
			enabled = false,
		},
		char = {
			enabled = true,
			jump_labels = true,
			keys = {},
		},
	},
})

-- Flash
local Flash = require("flash")
local keymap = vim.keymap

keymap.set({ "n", "x", "o" }, "s", function()
	Flash.jump()
end, { desc = "Flash" })

keymap.set({ "n", "x", "o" }, "S", function()
	Flash.treesitter()
end, { desc = "Flash Treesitter" })

keymap.set("o", "r", function()
	Flash.remote()
end, { desc = "Remote Flash" })

keymap.set({ "o", "x" }, "R", function()
	Flash.treesitter_search()
end, { desc = "Treesitter Search" })

keymap.set("c", "<C-s>", function()
	Flash.toggle()
end, { desc = "Toggle Flash Search" })
