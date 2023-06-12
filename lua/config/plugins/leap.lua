return {
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require('leap')
			vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
			-- vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true, })
			-- Of course, specify some nicer shades instead of the default "red" and "blue".
			-- vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red', bold = true, nocombine = true, })
			-- vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'blue', bold = true, nocombine = true, })
			-- Try it without this setting first, you might find you don't even miss it.
			leap.opts.highlight_unlabeled_phase_one_targets = true
			leap.opts.safe_labels = {}
			leap.opts.labels = { 'a', 'r', 's', 't', 'n', 'e', 'i', 'o', 'w', 'f', 'u', 'y', 'd', 'h' }
			vim.keymap.set("n", "<ESC>", function()
				local current_window = vim.fn.win_getid()
				leap.leap { target_windows = { current_window } }
			end)
		end
	}
}
