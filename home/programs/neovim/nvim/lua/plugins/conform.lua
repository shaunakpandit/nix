vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

-- setup: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		typescript = { "dprint" },
		typescriptreact = { "dprint" },
		php = {},
        nix = {"nixfmt", "nixpkgs-fmt"},
		-- You can also customize some of the format options for the filetype
		-- You can use a function here to determine the formatters dynamically
		-- Use the "*" filetype to run formatters on all filetypes.
		-- ["*"] = { "codespell" },
		-- Use the "_" filetype to run formatters on filetypes that don't
		-- have other formatters configured.
		-- ["_"] = { "trim_whitespace" },
	},
})
