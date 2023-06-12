local M = {}

local F = {}

M.config = {
	{
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu',
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			{
				"folke/trouble.nvim",
				opts = {
					use_diagnostic_signs = true,
					action_keys = {
						close = "<esc>",
						previous = "u",
						next = "e"
					},
				},
			},
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				build = function()
					vim.cmd([[MasonInstall]])
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{
				'j-hui/fidget.nvim',
				tag = "legacy"
			},
			"folke/neodev.nvim",
			"ray-x/lsp_signature.nvim",
			"ldelossa/nvim-dap-projects",
			{
				"lvimuser/lsp-inlayhints.nvim",
				branch = "anticonceal",
			},
			-- "mjlbach/lsp_signature.nvim",
		},

		config = function()
			local lsp = require('lsp-zero').preset({})
			M.lsp = lsp

			lsp.ensure_installed({
				'tsserver',
				'eslint',
				'gopls',
				'jsonls',
			})

			-- F.configureInlayHints()

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				client.server_capabilities.semanticTokensProvider = nil
				require("config.plugins.autocomplete").configfunc()
				-- require("lsp_signature").on_attach(F.signature_config, bufnr)
				-- require("lsp-inlayhints").on_attach(client, bufnr)
				-- vim.api.nvim_create_augroup("lsp_augroup", { clear = true })
				-- vim.api.nvim_create_autocmd("InsertEnter", {
				-- 	buffer = bufnr,
				-- 	callback = function() vim.lsp.inlay_hint(bufnr, false) end,
				-- 	group = "lsp_augroup",
				-- })
				-- vim.lsp.inlay_hint(bufnr, true)
				-- vim.api.nvim_create_autocmd("InsertLeave", {
				-- 	buffer = bufnr,
				-- 	callback = function() vim.lsp.inlay_hint(bufnr, true) end,
				-- 	group = "lsp_augroup",
				-- })
				-- vim.cmd('highlight! link LspInlayHint Comment')
				vim.diagnostic.config({
					severity_sort = true,
					underline = true,
					signs = true,
					virtual_text = false,
					update_in_insert = false,
					float = true,
				})
			end)

			lsp.set_sign_icons({
				error = '✘',
				warn = '▲',
				hint = '⚑',
				info = '»'
			})

			lsp.set_server_config({
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})

			lsp.format_on_save({
				format_opts = {
					-- async = false,
					-- timeout_ms = 10000,
				},
			})


			local lspconfig = require('lspconfig')

			require("config.lsp.lua").setup(lspconfig, lsp)
			require("config.lsp.json").setup(lspconfig, lsp)
			require("config.lsp.flutter").setup(lsp)
			-- require("config.lsp.html").setup(lspconfig, lsp)

			lsp.setup()
			require("fidget").setup({})

			local lsp_defaults = lspconfig.util.default_config
			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			require('nvim-dap-projects').search_project_config()

			F.configureDocAndSignature()
			F.configureKeybinds()

			local format_on_save_filetypes = {
				dart = true,
				json = true,
				go = true,
				lua = true,
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					if format_on_save_filetypes[vim.bo.filetype] then
						local lineno = vim.api.nvim_win_get_cursor(0)
						vim.lsp.buf.format({ async = false })
						vim.api.nvim_win_set_cursor(0, lineno)
					end
				end,
			})
		end
	},
}

F.configureInlayHints = function()
	require("lsp-inlayhints").setup({
		inlay_hints = {
			parameter_hints = {
				show = true,
				prefix = "<- ",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = true,
			},
			type_hints = {
				-- type and other hints
				show = true,
				prefix = "",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = false,
			},
			only_current_line = false,
			-- separator between types and parameter hints. Note that type hints are
			-- shown before parameter
			labels_separator = "  ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			highlight = "Comment",
		},
	})
end

F.configureDocAndSignature = function()
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help, {
			silent = true,
			focusable = false,
			border = "rounded",
		}
	)
	local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		pattern = "*",
		callback = function()
			vim.diagnostic.open_float(0, {
				scope = "cursor",
				focusable = false,
				close_events = {
					"CursorMoved",
					"CursorMovedI",
					"BufHidden",
					"InsertCharPre",
					"WinLeave",
				},
			})
		end,
		group = group,
	})
	-- vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
	-- 	pattern = "*",
	-- 	command = "silent! lua vim.lsp.buf.signature_help()",
	-- 	group = group,
	-- })

	-- F.signature_config = {
	-- 	bind = false,
	-- 	floating_window = true,
	-- 	hint_inline = function() return false end,
	-- 	handler_opts = {
	-- 		border = "rounded"
	-- 	}
	-- }
	-- local lspsignature = require('lsp_signature')
	-- lspsignature.setup(F.signature_config)
end


F.configureKeybinds = function()
	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			local opts = { buffer = event.buf, noremap = true, nowait = true }

			vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			-- vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
			vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)
			-- vim.keymap.set('x', '<leader>aw', vim.lsp.buf.range_code_action, opts)
			-- vim.keymap.set('x', "<leader>,", vim.lsp.buf.range_code_action, opts)
			vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
			vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
			vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)
		end
	})
end

return M
