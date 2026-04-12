vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- config: https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter").install({
	"go",
	"php",
	"phpdoc",
	"typescript",
	"tmux",
	"c_sharp",
	"css",
	"lua",
	"vim",
	"markdown",
	"markdown_inline",
	"html",
	-- "latex",
	"yaml",
	"nix",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "go", "tsx", "ts", "cs", "lua", "md" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
