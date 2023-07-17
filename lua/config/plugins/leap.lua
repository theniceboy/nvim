return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			labels = "arstneiowfuydh",
			search = {
				-- search/jump in all windows
				multi_window = true,
				-- search direction
				forward = true,
				-- when `false`, find only matches in the given direction
				wrap = true,
				---@type Flash.Pattern.Mode
				-- Each mode will take ignorecase and smartcase into account.
				-- * exact: exact match
				-- * search: regular search
				-- * fuzzy: fuzzy search
				mode = "fuzzy",
			},
			jump = {
				-- save location in the jumplist
				jumplist = true,
				-- jump position
				pos = "start", ---@type "start" | "end" | "range"
				-- add pattern to search history
				history = false,
				-- add pattern to search register
				register = false,
				-- clear highlight after jump
				nohlsearch = false,
				-- automatically jump when there is only one match
				autojump = false,
				-- You can force inclusive/exclusive jumps by setting the
				-- `inclusive` option. By default it will be automatically
				-- set based on the mode.
				inclusive = nil, ---@type boolean?
				-- jump position offset. Not used for range jumps.
				-- 0: default
				-- 1: when pos == "end" and pos < current position
				offset = nil, ---@type number
			},
			label = {
				-- allow uppercase labels
				uppercase = false,
				-- add any labels with the correct case here, that you want to exclude
				exclude = "",
				-- add a label for the first match in the current window.
				-- you can always jump to the first match with `<CR>`
				current = true,
				-- show the label after the match
				after = true, ---@type boolean|number[]
				-- show the label before the match
				before = false, ---@type boolean|number[]
				-- position of the label extmark
				style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
				-- flash tries to re-use labels that were already assigned to a position,
				-- when typing more characters. By default only lower-case labels are re-used.
				reuse = "lowercase", ---@type "lowercase" | "all"
				-- for the current window, label targets closer to the cursor first
				distance = true,
				-- minimum pattern length to show labels
				-- Ignored for custom labelers.
				min_pattern_length = 0,
				-- Enable this to use rainbow colors to highlight labels
				-- Can be useful for visualizing Treesitter ranges.
				rainbow = {
					enabled = true,
					-- number between 1 and 9
					shade = 8,
				},
			},
			highlight = {
				-- show a backdrop with hl FlashBackdrop
				backdrop = true,
				-- Highlight the search matches
				matches = true,
				-- extmark priority
				priority = 5000,
			},
			modes = {
				-- options used when flash is activated through
				-- a regular search with `/` or `?`
				search = {
					-- when `true`, flash will be activated during regular search by default.
					-- You can always toggle when searching with `require("flash").toggle()`
					enabled = true,
					highlight = { backdrop = false },
					jump = { history = true, register = true, nohlsearch = true },
					search = {
						-- `forward` will be automatically set to the search direction
						-- `mode` is always set to `search`
						-- `incremental` is set to `true` when `incsearch` is enabled
					},
				},
				-- options used when flash is activated through
				-- `f`, `F`, `t`, `T`, `;` and `,` motions
				char = {
					enabled = true,
					-- dynamic configuration for ftFT motions
					config = function(opts)
						-- autohide flash when in operator-pending mode
						opts.autohide = vim.fn.mode(true):find("no") and vim.v.operator == "y"

						-- disable jump labels when enabled and when using a count
						opts.jump_labels = opts.jump_labels and vim.v.count == 0

						-- Show jump labels only in operator-pending mode
						-- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
					end,
					-- hide after jump when not using jump labels
					autohide = false,
					-- show jump labels
					jump_labels = false,
					-- set to `false` to use the current line only
					multi_line = true,
					-- When using jump labels, don't use these keys
					-- This allows using those keys directly after the motion
					label = { exclude = "neiukadc" },
					-- by default all keymaps are enabled, but you can disable some of them,
					-- by removing them from the list.
					-- If you rather use another key, you can map them
					-- to something else, e.g., { [";"] = "L", [","] = H }
					keys = {},
					---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
					-- The direction for `prev` and `next` is determined by the motion.
					-- `left` and `right` are always left and right.
					char_actions = function(motion)
						return {
							[";"] = "next", -- set to `right` to always go right
							[","] = "prev", -- set to `left` to always go left
							-- clever-f style
							[motion:lower()] = "next",
							[motion:upper()] = "prev",
							-- jump2d style: same case goes next, opposite case goes prev
							-- [motion] = "next",
							-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
						}
					end,
					search = { wrap = false },
					highlight = { backdrop = true },
					jump = { register = false },
				},
				-- options used for treesitter selections
				-- `require("flash").treesitter()`
				treesitter = {
					labels = "arstneiowfuydh",
					jump = { pos = "range" },
					search = { incremental = false },
					label = { before = true, after = true, style = "inline" },
					highlight = {
						backdrop = false,
						matches = false,
					},
				},
				treesitter_search = {
					jump = { pos = "range" },
					search = { multi_window = true, wrap = true, incremental = false },
					remote_op = { restore = true },
					label = { before = true, after = true, style = "inline" },
				},
				-- options used for remote flash
				remote = {
					remote_op = { restore = true, motion = true },
				},
			},
			-- options for the floating window that shows the prompt,
			-- for regular jumps
			prompt = {
				enabled = true,
				prefix = { { "⚡", "FlashPromptIcon" } },
				win_config = {
					relative = "editor",
					width = 1, -- when <=1 it's a percentage of the editor width
					height = 1,
					row = -1, -- when negative it's an offset from the bottom
					col = 0, -- when negative it's an offset from the right
					zindex = 1000,
				},
			},
			-- options for remote operator pending mode
			remote_op = {
				-- restore window views and cursor position
				-- after doing a remote operation
				restore = false,
				-- For `jump.pos = "range"`, this setting is ignored.
				-- `true`: always enter a new motion when doing a remote operation
				-- `false`: use the window's cursor position and jump target
				-- `nil`: act as `true` for remote windows, `false` for the current window
				motion = false,
			},
		},
		keys = {
			{
				"<ESC>",
				mode = { "n" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"tt",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- {
			-- 	"r",
			-- 	mode = "o",
			-- 	function()
			-- 		require("flash").remote()
			-- 	end,
			-- 	desc = "Remote Flash",
			-- },
			{
				"/",
				mode = { "o", "x" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Treesitter Search",
			},
			-- {
			-- 	"<c-s>",
			-- 	mode = { "c" },
			-- 	function()
			-- 		require("flash").toggle()
			-- 	end,
			-- 	desc = "Toggle Flash Search",
			-- },
		},
	}
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		local leap = require('leap')
	-- 		vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
	-- 		-- vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true, })
	-- 		-- Of course, specify some nicer shades instead of the default "red" and "blue".
	-- 		-- vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red', bold = true, nocombine = true, })
	-- 		-- vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'blue', bold = true, nocombine = true, })
	-- 		-- Try it without this setting first, you might find you don't even miss it.
	-- 		leap.opts.highlight_unlabeled_phase_one_targets = true
	-- 		leap.opts.safe_labels = {}
	-- 		leap.opts.labels = { 'a', 'r', 's', 't', 'n', 'e', 'i', 'o', 'w', 'f', 'u', 'y', 'd', 'h' }
	-- 		vim.keymap.set("n", "<ESC>", function()
	-- 			local current_window = vim.fn.win_getid()
	-- 			leap.leap { target_windows = { current_window } }
	-- 		end)
	-- 	end
	-- }
}
