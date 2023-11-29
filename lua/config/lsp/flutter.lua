local preview_stack_trace = function()
	local line = vim.api.nvim_get_current_line()
	local pattern = "package:[^/]+/([^:]+):(%d+):(%d+)"
	local filepath, line_nr, column_nr = string.match(line, pattern)
	if filepath and line_nr and column_nr then
		vim.cmd(":wincmd k")
		vim.cmd("e " .. filepath)
		vim.api.nvim_win_set_cursor(0, { tonumber(line_nr), tonumber(column_nr) })
		vim.cmd(":wincmd j")
	end
end
return {
	setup = function(lsp)
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "__FLUTTER_DEV_LOG__",
			callback = function()
				vim.keymap.set("n", "p", preview_stack_trace, { silent = true, noremap = true, buffer = true })
			end
		})
		local dart_lsp = lsp.build_options('dartls', {})

		local flutter = require('flutter-tools')
		flutter.setup({
			fvm = true,
			widget_guides = {
				enabled = true,
			},
			ui = {
				border = "rounded",
				notification_style = 'nvim-notify'
			},
			lsp = {
				on_attach = function()
					vim.cmd('highlight! link FlutterWidgetGuides Comment')
				end,
				capabilities = dart_lsp.capabilities,
				settings = {
					enableSnippets = true,
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
						"!(url:startsWith('package:flutter/') || url:startsWith('package:flutter_test/') || url:startsWith('package:dartpad_sample/') || url:startsWith('package:flutter_localizations/'))"
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
