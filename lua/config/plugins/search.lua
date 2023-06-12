return {
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require('hlslens').setup()
			local kopts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap('n', '=',
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts)
			vim.api.nvim_set_keymap('n', '-',
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts)
			vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', '<Leader><CR>', '<Cmd>noh<CR>', kopts)
		end
	},
	{
		"pechorin/any-jump.vim",
		config = function()
			vim.keymap.set("n", "j", ":AnyJump<CR>", { noremap = true })
			vim.keymap.set("x", "j", ":AnyJumpVisual<CR>", { noremap = true })
			vim.g.any_jump_disable_default_keybindings = true
			vim.g.any_jump_window_width_ratio = 0.9
			vim.g.any_jump_window_height_ratio = 0.9
		end
	}
}
