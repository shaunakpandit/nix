vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

-- LSP CONFIG
require("mason").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- THEA
		"vtsls",
		"dprint", -- formatter
		"intelephense",
		"phpstan", -- linter
		-- "roslyn_ls",
		"css-lsp",
		-- GO
		"gopls",
		"gofumpt", -- formatter
		"goimports",
		"golines",
		"gomodifytags",
		"gotests",
		-- LUA
		"lua-language-server",
		"stylua", -- formatter
		-- GENERAL
		"bash-language-server",
		"rust-analyzer",
		"helm-ls",
        -- nix
        "nil",
        "nixfmt",
        "nixpkgs-fmt"
	},
	auto_update = true,
})
