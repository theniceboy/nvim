return {
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			'nvim-telescope/telescope.nvim',
			{ 'kkharji/sqlite.lua', module = 'sqlite' },
		},
		config = function()
			vim.keymap.set("n", "<leader>y", ":Telescope neoclip<CR>", { noremap = true })
			require('neoclip').setup({
				history = 1000,
				enable_persistent_history = true,
				keys = {
					telescope = {
						i = {
							select = '<c-y>',
							paste = '<cr>',
							paste_behind = '<c-g>',
							replay = '<c-q>', -- replay a macro
							delete = '<c-d>', -- delete an entry
							edit = '<c-k>', -- edit an entry
							custom = {},
						},
					},
				},
			})
		end
	},
}
