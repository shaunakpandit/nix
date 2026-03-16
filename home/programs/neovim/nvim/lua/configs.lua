local vim = vim

local opt = vim.opt
opt.colorcolumn = "80" -- Highlight column 80
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.listchars = "tab:  ,multispace:  ,eol: " -- Characters to show for tabs, spaces, and end of line
vim.g.mapleader = " "
vim.g.maplocalleader = ","
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.wrap = false -- Disable line wrapping
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
opt.undofile = true -- Enable persistent undo
opt.completeopt = { "menuone", "preview", "noinsert" } -- Options for completion menu
opt.winborder = "single" -- Use rounded borders for windows
opt.hlsearch = true -- Enable highlighting of search results
vim.opt.clipboard = "unnamedplus" -- yank to system clipboard

vim.g.pack_lockfile = vim.fn.stdpath("data") .. "/nvim-pack-lock.json" -- for nixos lock file editable

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation
