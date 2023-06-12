return {
	"numToStr/Comment.nvim",
	config = function()
		local api = require("Comment.api")
		vim.keymap.set("n", "<leader>cn", api.locked("comment.linewise.current"))
		vim.keymap.set("n", "<leader>cu", api.locked("uncomment.linewise.current"))
		local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
		vim.keymap.set('x', '<leader>cn', function()
			vim.api.nvim_feedkeys(esc, 'nx', false)
			api.locked('comment.linewise')(vim.fn.visualmode())
		end)
		vim.keymap.set('x', '<leader>cu', function()
			vim.api.nvim_feedkeys(esc, 'nx', false)
			api.locked('uncomment.linewise')(vim.fn.visualmode())
		end)
		vim.keymap.set('x', '<leader>ce', function()
			vim.api.nvim_feedkeys(esc, 'nx', false)
			api.locked('toggle.blockwise')(vim.fn.visualmode())
		end)
		require('Comment').setup({
			padding = true,
			sticky = true,
			mappings = {
				basic = false,
				extra = false,
			},
		})
	end
}
