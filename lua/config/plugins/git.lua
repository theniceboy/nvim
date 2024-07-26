return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup({
				signs = {
					add          = { text = '▎' },
					change       = { text = '░' },
					delete       = { text = '_' },
					topdelete    = { text = '▔' },
					changedelete = { text = '▒' },
					untracked    = { text = '┆' },
				},
			})
			vim.keymap.set("n", "<leader>g-", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>g=", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "H", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
		end
	},
	{
		"kdheepak/lazygit.nvim",
		keys = { "<c-g>" },
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1.0
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_use_neovim_remote = true
			vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
		end
	},
	-- {
	-- 	"APZelos/blamer.nvim",
	-- 	config = function()
	-- 		vim.g.blamer_enabled = true
	-- 		vim.g.blamer_relative_time = true
	-- 	end
	-- }
}
