return {
	{
		"dart-lang/dart-vim-plugin",
		ft = "dart",
		config = function()
			vim.g.dart_corelib_highlight = false
			vim.g.dart_format_on_save = false
		end
	}
}
