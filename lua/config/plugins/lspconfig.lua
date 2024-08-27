local M = {}

local F = {}

local documentation_window_open = false

M.config = {
	{
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu',
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
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
			-- "MunifTanjim/prettier.nvim",
			-- "mjlbach/lsp_signature.nvim",
			"airblade/vim-rooter",
			"b0o/schemastore.nvim",
			{
				'laytan/tailwind-sorter.nvim',
				dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
				build = 'cd formatter && npm ci && npm run build',
				config = {
					on_save_enabled = true,
				}
			},
		},

		config = function()
			local lsp = require('lsp-zero').preset({})
			M.lsp = lsp

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {
					"biome",
					"cssls",
					'tsserver',
					'eslint',
					'gopls',
					'jsonls',
					'html',
					'clangd',
					'dockerls',
					'ansiblels',
					'terraformls',
					'texlab',
					'pyright',
					'yamlls',
					'tailwindcss',
					'taplo',
				}
			})

			lsp.on_attach(function(client, bufnr)
				if client.name == "tsserver" then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
				lsp.default_keymaps({ buffer = bufnr })
				client.server_capabilities.semanticTokensProvider = nil
				require("config.plugins.autocomplete").configfunc()
				-- if vim.bo[bufnr].filetype ~= "dart" then
				require("lsp_signature").on_attach(F.signature_config, bufnr)
				-- end
				vim.diagnostic.config({
					severity_sort = true,
					underline = true,
					signs = true,
					virtual_text = false,
					update_in_insert = false,
					float = true,
				})

				lsp.set_sign_icons({
					error = '✘',
					warn = '▲',
					hint = '⚑',
					info = '»'
				})
			end)

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
			require("config.lsp.html").setup(lspconfig, lsp)

			require 'lspconfig'.html.setup {}
			require 'lspconfig'.pyright.setup {}
			require 'lspconfig'.tailwindcss.setup {}

			require 'lspconfig'.tsserver.setup {}
			require 'lspconfig'.biome.setup {}
			require 'lspconfig'.cssls.setup {}

			require 'lspconfig'.taplo.setup {}

			require 'lspconfig'.terraformls.setup {}
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = { "*.tf", "*.tfvars", "*.lua" },
				callback = function()
					vim.lsp.buf.format()
				end,
			})

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				pattern = { "*.hcl" },
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()
					local filename = vim.api.nvim_buf_get_name(bufnr)
					vim.fn.system(string.format("packer fmt %s", vim.fn.shellescape(filename)))
					vim.cmd("edit!")
				end,
			})
			require 'lspconfig'.yamlls.setup({
				settings = {
					redhat = {
						telemetry = {
							enabled = false
						}
					},
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						-- schemas = require('schemastore').yaml.schemas(),
						validate = false,
						customTags = {
							"!fn",
							"!And",
							"!If",
							"!Not",
							"!Equals",
							"!Or",
							"!FindInMap sequence",
							"!Base64",
							"!Cidr",
							"!Ref",
							"!Sub",
							"!GetAtt",
							"!GetAZs",
							"!ImportValue",
							"!Select",
							"!Split",
							"!Join sequence"
						}
					},
				}
			})

			require 'lspconfig'.gopls.setup {}

			lsp.setup()


			-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
			local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
			for _, ls in ipairs(language_servers) do
				require('lspconfig')[ls].setup({
					capabilities = capabilities
					-- you can add other fields for setting up lsp server in this table
				})
			end

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
				html = true,
				css = true,
				javascript = true,
				typescript = true,
				typescriptreact = true,
				c = true,
				cpp = true,
				objc = true,
				objcpp = true,
				dockerfile = true,
				terraform = false,
				tex = true,
				toml = true,
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					if format_on_save_filetypes[vim.bo.filetype] then
						local lineno = vim.api.nvim_win_get_cursor(0)
						vim.lsp.buf.format({ async = false })
						pcall(vim.api.nvim_win_set_cursor, 0, lineno)
					end
				end,
			})
		end
	},
}

F.configureDocAndSignature = function()
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help, {
			-- silent = true,
			focusable = false,
			border = "rounded",
			zindex = 60,
		}
	)
	local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		pattern = "*",
		callback = function()
			if not documentation_window_open then
				vim.diagnostic.open_float(0, {
					scope = "cursor",
					focusable = false,
					zindex = 10,
					close_events = {
						"CursorMoved",
						"CursorMovedI",
						"BufHidden",
						"InsertCharPre",
						"InsertEnter",
						"WinLeave",
						"ModeChanged",
					},
				})
			end
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

local documentation_window_open_index = 0
local function show_documentation()
	documentation_window_open_index = documentation_window_open_index + 1
	local current_index = documentation_window_open_index
	documentation_window_open = true
	vim.defer_fn(function()
		if current_index == documentation_window_open_index then
			documentation_window_open = false
		end
	end, 500)
	vim.lsp.buf.hover()
end

F.configureKeybinds = function()
	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			local opts = { buffer = event.buf, noremap = true, nowait = true }

			vim.keymap.set('n', '<leader>h', show_documentation, opts)
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
