return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"R",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	opts = {
		floating_window_scaling_factor = 1,
		yazi_floating_window_border = "none",
		open_for_directories = true,
		open_multiple_tabs = true,
		keymaps = {
			show_help = '<f1>',
			open_file_in_vertical_split = '<c-v>',
			open_file_in_horizontal_split = '<c-x>',
			open_file_in_tab = '<c-t>',
			grep_in_directory = '<c-s>',
			replace_in_directory = '<c-r>',
			cycle_open_buffers = '<tab>',
			copy_relative_path_to_selected_files = '<c-y>',
			send_to_quickfix_list = '<c-q>',
		},
	},
}

