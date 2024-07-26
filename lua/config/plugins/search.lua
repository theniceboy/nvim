return {
	{
		"kevinhwang91/nvim-hlslens",
		lazy = false,
		enabled = true,
		keys = {
			{
				"=",
				[[<cmd>execute('normal! ' . v:count1 . 'n')<cr>]] .. [[<cmd>lua require("hlslens").start()<cr>]],
			},
			{
				"-",
				[[<cmd>execute('normal! ' . v:count1 . 'N')<cr>]] .. [[<cmd>lua require("hlslens").start()<cr>]],
			},
			{ "*",  "*" .. [[<cmd>lua require("hlslens").start()<cr>]] },
			{ "#",  "#" .. [[<cmd>lua require("hlslens").start()<cr>]] },
			{ "g*", "g*" .. [[<cmd>lua require("hlslens").start()<cr>]] },
			{ "g#", "g#" .. [[<cmd>lua require("hlslens").start()<cr>]] },
		},
		config = function()
			require("scrollbar.handlers.search").setup()
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
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>F",
				mode = "n",
				function()
					require("spectre").open()
				end,
				desc = "Project find and replace"
			}
		}
	}
}
