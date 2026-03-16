vim.pack.add({
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim", name = "blackmetal" },
})

require("black-metal").setup({
	theme = "immortal",
	colors = {
		alt = "#5f8787",
		alt_bg = "#1b161f",
		bg = "#000000",
		comment = "#505050",
		constant = "#7799bb",
		fg = "#c1c1c1",
		func = "#888888",
		keyword = "#999999",
		line = "#000000",
		number = "#7799bb",
		operator = "#9b99a3",
		property = "#c1c1c1",
		string = "#7799bb", -- first accent
		type = "#556677", -- second accent
		visual = "#333333",
		diag_red = "#5f8787",
		diag_blue = "#333333",
		diag_yellow = "#e8b589",
		diag_green = "#6e4c4c",
	},
})
require("black-metal").load()
