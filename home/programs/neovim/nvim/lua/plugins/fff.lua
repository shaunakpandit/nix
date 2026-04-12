local vim = vim

vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		if event.data.updated then
			require("fff.download").download_or_build_binary()
		end
	end,
})

-- the plugin will automatically lazy load
vim.g.fff = {
	lazy_sync = true, -- start syncing only when the picker is open
	debug = {
		enabled = true,
		show_scores = true,
	},
}

vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "FFFind files" })

vim.keymap.set("n", "fw", function()
	require("fff").live_grep()
end, { desc = "FFLive grep" })

vim.keymap.set("n", "fc", function()
	require("fff").live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "FFLive grep word under cursor" })

vim.keymap.set("n", "fg", function()
	require("fff").find_files({ query = "git:modified " })
end, { desc = "FFLive find files in git diff" })

vim.keymap.set("n", "fG", function()
	require("fff").live_grep({ query = "git:modified " })
end, { desc = "FFLive grep word in git diff" })

-- config: https://github.com/dmtrKovalenko/fff.nvim?tab=readme-ov-file#configuration
require("fff").setup({
	layout = {
		prompt_position = "top",
	},
	keymaps = {
		move_up = { "<Up>", "<C-k>" },
		move_down = { "<Down>", "<C-j>" },
	},
})
