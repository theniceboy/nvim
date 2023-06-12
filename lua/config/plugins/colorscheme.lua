return {
	"theniceboy/nvim-deus",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme deus]])
	end,
}
