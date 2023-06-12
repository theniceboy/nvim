return {
	'gelguy/wilder.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wilder = require('wilder')
		wilder.setup {
			modes = { ':' },
			next_key = '<Tab>',
			previous_key = '<S-Tab>',
		}
		wilder.set_option('renderer', wilder.popupmenu_renderer(
			wilder.popupmenu_palette_theme({
				highlights = {
					border = 'Normal', -- highlight to use for the border
				},
				left = { ' ', wilder.popupmenu_devicons() },
				right = { ' ', wilder.popupmenu_scrollbar() },
				border = 'rounded',
				max_height = '75%',  -- max height of the palette
				min_height = 0,      -- set to the same as 'max_height' for a fixed height window
				prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
				reverse = 0,         -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
			})
		))
		wilder.set_option('pipeline', {
			wilder.branch(
				wilder.cmdline_pipeline({
					language = 'vim',
					fuzzy = 1,
				}), wilder.search_pipeline()
			),
		})
	end
}
