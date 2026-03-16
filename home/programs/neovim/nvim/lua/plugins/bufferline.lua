vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim" },
})

require("bufferline").setup({
	options = {
		style_preset = require("bufferline").style_preset.minimal,
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
	},
})
