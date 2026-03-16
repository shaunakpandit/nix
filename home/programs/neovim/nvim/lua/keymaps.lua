local keymap = vim.keymap

-- PACKAGES
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end
keymap.set("n", "<leader>pc", pack_clean)
keymap.set("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- config related keymaps
keymap.set({ "n", "v", "x" }, "<leader>o", "<Cmd>source %<CR>", { desc = "Source " .. vim.fn.expand("$MYVIMRC") })
keymap.set({ "n", "v", "x" }, "<leader>O", "<Cmd>restart<CR>", { desc = "Restart vim." })

-- movement
keymap.set("n", "gh", "0", { desc = "Jump: Start of line" })
keymap.set("n", "gl", "$", { desc = "Jump: End of line" })

-- norm
keymap.set({ "n", "v", "x" }, "<leader>n", ":norm ", { desc = "ENTER NORM COMMAND." })

-- Open Netrw in the current file's directory
keymap.set("n", "<Leader>ex", "<cmd>Ex %:p:h<CR>")

-- Exit insert mode with jk
keymap.set({ "i", "v" }, "jk", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Exit mode",
})

-- BUFFER BINDS
-- close buffer
keymap.set("n", "<leader>qq", ":q<CR>", {
	noremap = true,
	silent = true,
	desc = "Exit buffer",
})
-- close buffer
keymap.set("n", "QQ", ":q!<enter>", {
	noremap = true,
	silent = true,
	desc = "Exit buffer",
})

-- save buffer (no-format)
keymap.set("n", "<leader>ww", ":noau w<CR>", {
	noremap = true,
	silent = true,
	desc = "Save buffer without autocommand",
})
-- save buffer
keymap.set("n", "WW", ":w!<enter>", {
	noremap = true,
	silent = true,
	desc = "Save buffer",
})

-- navigate buffeer stack
keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

-- buffer closing
keymap.set("n", "<leader>bd", "<cmd>bd<CR>")
keymap.set("n", "<leader>bD", "<cmd>bd!<CR>")
keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>")
keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>")
keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseRight<CR>")

-- Use <Esc> to exit terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
keymap.set({ "t", "i" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set({ "t", "i" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set({ "t", "i" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set({ "t", "i" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window", remap = true })
keymap.set({ "n" }, "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set({ "n" }, "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set({ "n" }, "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set({ "n" }, "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- LSP Keymaps
keymap.set("n", "fd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- Go to definition
keymap.set("n", "fr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true }) -- Go to references
keymap.set("n", "fn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true }) -- rename
keymap.set("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", { silent = true }) -- Format the current buffer using LSP
