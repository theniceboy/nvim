vim.keymap.set('n', '<c-c>', require("telescope").extensions.flutter.commands, { noremap = true })
vim.keymap.set('n', "<leader>'c", ":FlutterLogClear<CR>", { noremap = true })
vim.keymap.set('n', "<leader>'r", ":FlutterRestart<CR>", { noremap = true })
-- vim.keymap.set('n', 'r', ":FlutterRun<CR>", { noremap = true })

local toggle_log = function()
	local wins = vim.api.nvim_list_wins()

	for _, id in pairs(wins) do
		local bufnr = vim.api.nvim_win_get_buf(id)
		if vim.api.nvim_buf_get_name(bufnr):match '.*/([^/]+)$' == '__FLUTTER_DEV_LOG__' then
			return vim.api.nvim_win_close(id, true)
		end
	end

	pcall(function()
		vim.api.nvim_command 'sb + __FLUTTER_DEV_LOG__ | resize 15'
	end)
end

vim.keymap.set('n', "<leader>'l", toggle_log, { noremap = true })
