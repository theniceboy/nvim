return {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"kevinhwang91/nvim-hlslens",
	},
	config = function()
		local group = vim.api.nvim_create_augroup("scrollbar_set_git_colors", {})
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				vim.cmd([[
hi! ScrollbarGitAdd guifg=#8CC85F
hi! ScrollbarGitAddHandle guifg=#A0CF5D
hi! ScrollbarGitChange guifg=#E6B450
hi! ScrollbarGitChangeHandle guifg=#F0C454
hi! ScrollbarGitDelete guifg=#F87070
hi! ScrollbarGitDeleteHandle guifg=#FF7B7B ]])
			end,
			group = group,
		})
		require("scrollbar.handlers.search").setup({})
		require("scrollbar.handlers.gitsigns").setup()
		require("scrollbar").setup({
			show = true,
			handle = {
				text = " ",
				color = "#928374",
				hide_if_all_visible = true,
			},
			marks = {
				Search = { color = "yellow" },
				Misc = { color = "purple" },
			},
			handlers = {
				cursor = false,
				diagnostic = true,
				gitsigns = true,
				handle = true,
				search = true,
			},
		})
	end,
}
