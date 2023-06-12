return {
	setup = function(lsp)
		local dart_lsp = lsp.build_options('dartls', {})

		require('flutter-tools').setup({
			fvm = true,
			widget_guides = {
				enabled = true,
			},
			ui = {
				-- the border type to use for all floating windows, the same options/formats
				-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
				border = "rounded",
				-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
				-- please note that this option is eventually going to be deprecated and users will need to
				-- depend on plugins like `nvim-notify` instead.
				notification_style = 'nvim-notify'
			},
			lsp = {
				on_attach = function()
					vim.cmd('highlight! link FlutterWidgetGuides Comment')
				end,
				capabilities = dart_lsp.capabilities,
				settings = {
					enableSnippets = false,
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = {
						vim.fn.expand '$HOME/.pub-cache',
						vim.fn.expand '$HOME/fvm',
					},
					lineLength = 100,
				},
			},
			dev_log = {
				enabled = true,
				notify_errors = true, -- if there is an error whilst running then notify the user
				open_cmd = "e",   -- command to use to open the log buffer
			},
			debugger = {
				-- integrate with nvim dap + install dart code debugger
				enabled = true,
				run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
				-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
				-- see |:help dap.set_exception_breakpoints()| for more info
				exception_breakpoints = {
					{
						filter = 'raised',
						label = 'Exceptions',
						condition =
						"!(url:startsWith('package:flutteR/') || url:startsWith('package:flutter_test/') || url:startsWith('package:dartpad_sample/') || url:startsWith('package:flutter_localizations/'))"
					}
				},
				register_configurations = function(_)
					local dap = require("dap")
					-- vim.notify(dap.configurations.dart)
					if not dap.configurations.dart then
						dap.adapters.dart = {
							type = "executable",
							command = "flutter",
							args = { "debug_adapter" }
						}
						dap.configurations.dart = {
							{
								-- flutter
								type = "dart",
								request = "launch",
								name = "Launch Flutter Program",
								-- The nvim-dap plugin populates this variable with the filename of the current buffer
								program = "lib/main.dart",
								-- program = "${file}",
								-- The nvim-dap plugin populates this variable with the editor's current working directory
								cwd = "${workspaceFolder}",
								-- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
								toolArgs = { "-d", "macos" }
							}
						}
					end
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})
	end
}
