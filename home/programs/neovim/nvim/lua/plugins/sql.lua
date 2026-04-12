vim.pack.add({
	{ src = "https://github.com/tpope/vim-dadbod" },
	{ src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
	{ src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
})

vim.g.dbs = {
	{ name = "musicleague", url = "mysql://mluser:mlpassword@192.168.4.28:33061/musicleague" },
	-- {
	-- 	name = "production",
	-- 	url = function()
	-- 		return vim.fn.system("get-prod-url")
	-- 	end,
	-- },
}

vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "DB connect" })
