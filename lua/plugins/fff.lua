return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	lazy = true,
	keys = {
		{
			"<c-p>",
			function()
				require("fff").find_files()
			end,
			mode = "n",
			desc = "Find files (FFF)",
		},
	},
	config = function()
		require("fff").setup({
			prompt = "🔍 ",
			layout = {
				height = 0.9,
				width = 0.9,
				prompt_position = "bottom",
				preview_position = "right",
				preview_size = 0.55,
			},
			keymaps = {
				close = "<Esc>",
				select = "<CR>",
				select_split = "<C-s>",
				select_vsplit = "<C-v>",
				select_tab = "<C-t>",
				move_up = { "<Up>", "<C-u>", "<C-p>" },
				move_down = { "<Down>", "<C-e>", "<C-n>" },
				preview_scroll_up = "<C-l>",
				preview_scroll_down = "<C-y>",
				toggle_debug = "<F2>",
			},
		})
	end,
}
