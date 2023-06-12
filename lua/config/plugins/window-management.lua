return {
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
	},
	{
		"nyngwang/NeoZoom.lua",
		config = function()
			vim.keymap.set('n', '<leader>f', ':NeoZoomToggle<CR>', { silent = true, nowait = true })
			require('neo-zoom').setup {
				popup = { enabled = true }, -- this is the default.
				-- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
				-- EXPLAIN: This improves the performance, and you won't see two
				--          identical buffers got updated at the same time.
				-- popup = {
				--   enabled = true,
				--   exclude_filetypes = {},
				--   exclude_buftypes = {},
				-- },
				exclude_buftypes = { 'terminal' },
				-- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
				winopts = {
					offset = {
						-- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
						-- top = 0,
						-- left = 0.17,
						width = 1.0,
						height = 1.0,
					},
					-- NOTE: check :help nvim_open_win() for possible border values.
					border = 'thicc', -- this is a preset, try it :)
				},
				presets = {
					-- {
					-- 	-- NOTE: regex pattern can be used here!
					-- 	filetypes = { 'dapui_.*', 'dap-repl' },
					-- 	winopts = {
					-- 		offset = { top = 0.02, left = 0.26, width = 0.74, height = 0.25 },
					-- 	},
					-- },
					{
						filetypes = { 'markdown' },
						callbacks = {
							function() vim.wo.wrap = true end,
						},
					},
				},
			}
		end
	}
}
