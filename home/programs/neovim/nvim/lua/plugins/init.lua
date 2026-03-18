-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.
local vim = vim

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd("packadd! nohlsearch")

-- [[ Install plugins ]]
-- Nvim functionality can be extended by installing external plugins.
-- One way to do it is with a built-in plugin manager. See `:h vim.pack`.
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
})
require("gitsigns").setup({ signcolumn = true })
require("nvim-autopairs").setup()

-- THEMES
require("plugins.blackmetal")
-- require("plugins.vague")

-- MANAGED PLUGINS
require("plugins.mason")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.fff")
require("plugins.dap")
require("plugins.flash")
require("plugins.bufferline")
require("plugins.yanky")
require("plugins.conform")
require("plugins.iwe")
