return {
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup({
				-- Terminal window settings
				window = {
					split_ratio = 0.4, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
					position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
					enter_insert = true, -- Whether to enter insert mode when opening Claude Code
					hide_numbers = true, -- Hide line numbers in the terminal window
					hide_signcolumn = true, -- Hide the sign column in the terminal window
				},
				-- File refresh settings
				refresh = {
					enable = true,        -- Enable file change detection
					updatetime = 100,     -- updatetime when Claude Code is active (milliseconds)
					timer_interval = 1000, -- How often to check for file changes (milliseconds)
					show_notifications = true, -- Show notification when files are reloaded
				},
				-- Git project settings
				git = {
					use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
				},
				-- Shell-specific settings
				shell = {
					separator = '&&', -- Command separator used in shell commands
					pushd_cmd = 'pushd', -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
					popd_cmd = 'popd', -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
				},
				-- Command settings
				command = "claude", -- Command used to launch Claude Code
				-- Command variants
				command_variants = {
					-- Conversation management
					continue = "--continue", -- Resume the most recent conversation
					resume = "--resume", -- Display an interactive conversation picker

					-- Output options
					verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
				},
				-- Keymaps
				keymaps = {
					toggle = {
						normal = "<A-c>",   -- Normal mode keymap for toggling Claude Code, false to disable
						terminal = "<A-c>", -- Terminal mode keymap for toggling Claude Code, false to disable
						variants = {
							continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
							verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
						},
					},
					window_navigation = false, -- Enable window navigation keymaps (<C-h/j/k/l>)
					scrolling = false,    -- Enable scrolling keymaps (<C-f/b>) for page up/down
				}
			})
		end
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			panel = {
	-- 				enabled = false,
	-- 				-- auto_refresh = true,
	-- 				-- keymap = {
	-- 				-- 	jump_prev = "[[",
	-- 				-- 	jump_next = "]]",
	-- 				-- 	accept = "<c-c>",
	-- 				-- 	refresh = "gr",
	-- 				-- 	open = "<c-f>"
	-- 				-- },
	-- 				-- layout = {
	-- 				-- 	position = "bottom", -- | top | left | right
	-- 				-- 	ratio = 0.4
	-- 				-- },
	-- 			},
	-- 			suggestion = {
	-- 				enabled = true,
	-- 				auto_trigger = true,
	-- 				debounce = 75,
	-- 				keymap = {
	-- 					accept = "<c-c>",
	-- 					accept_word = false,
	-- 					accept_line = false,
	-- 					-- next = "<c-]>",
	-- 					-- prev = "<c-[>",
	-- 					-- dismiss = "<C-]>",
	-- 				},
	-- 			},
	-- 			filetypes = {
	-- 				-- yaml = false,
	-- 				-- markdown = false,
	-- 				-- help = false,
	-- 				-- gitcommit = false,
	-- 				-- gitrebase = false,
	-- 				-- hgcommit = false,
	-- 				-- svn = false,
	-- 				-- cvs = false,
	-- 				["*"] = true,
	-- 			},
	-- 			copilot_node_command = 'node', -- Node.js version must be > 16.x
	-- 			server_opts_overrides = {},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		vim.g.copilot_enabled = true
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.api.nvim_set_keymap('n', '<leader>go', ':Copilot<CR>', { silent = true })
	-- 		vim.api.nvim_set_keymap('n', '<leader>ge', ':Copilot enable<CR>', { silent = true })
	-- 		vim.api.nvim_set_keymap('n', '<leader>gd', ':Copilot disable<CR>', { silent = true })
	-- 		vim.api.nvim_set_keymap('i', '<c-p>', '<Plug>(copilot-suggest)', { noremap = true })
	-- 		vim.api.nvim_set_keymap('i', '<c-n>', '<Plug>(copilot-next)', { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap('i', '<c-l>', '<Plug>(copilot-previous)', { noremap = true, silent = true })
	-- 		vim.cmd('imap <silent><script><expr> <C-C> copilot#Accept("")')
	-- 		vim.cmd([[
	-- 		let g:copilot_filetypes = {
	--        \ 'TelescopePrompt': v:false,
	--      \ }
	-- 		]])
	-- 	end
	-- }
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	config = function()
	-- 		vim.g.codeium_disable_bindings = 1
	-- 		vim.keymap.set('i', '<C-c>', function() return vim.fn['codeium#Accept']() end, { expr = true })
	-- 		vim.keymap.set('i', '<c-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
	-- 		vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
	-- 		-- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
	-- 	end
	-- }
	-- {
	-- 	"jcdickinson/codeium.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({
	-- 		})
	-- 	end
	-- },
}
