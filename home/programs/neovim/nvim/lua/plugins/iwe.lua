vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/iwe-org/iwe.nvim" },
})

-- src: https://github.com/iwe-org/iwe.nvim
require("iwe").setup({
    picker = {
        backend = "vim_ui"
    }
})
