vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})

-- config: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md
require("nvim-treesitter.configs").setup({

	ensure_installed = {
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
        "nix",
		"markdown_inline",
		"html",
        "yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
    indent = {
        enable = true,
    }
})
