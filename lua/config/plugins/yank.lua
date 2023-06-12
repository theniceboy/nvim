return {
	{
		"gbprod/yanky.nvim",
		dependencies = {
			"kkharji/sqlite.lua",
		},
		config = function()
			vim.keymap.set("n", "<leader>y", ":Telescope yank_history<CR>")
			-- vim.keymap.set("n", "<c-u>", "<Plug>(YankyCycleForward)")
			-- vim.keymap.set("n", "<c-e>", "<Plug>(YankyCycleBackward)")
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

			require('yanky').setup({
				ring = {
					history_length = 2000,
					storage = "sqlite",
					sync_with_numbered_registers = true,
					cancel_event = "update",
				},
				picker = {
					select = {
						action = nil, -- nil to use default put action
					},
					telescope = {
						use_default_mappings = true, -- if default mappings should be used
						mappings = nil,        -- nil to use default mappings or no mappings (see `use_default_mappings`)
					},
				},
				system_clipboard = {
					sync_with_ring = true,
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 300,
				},
				preserve_cursor_position = {
					enabled = true,
				},
			})
		end
	},
}
