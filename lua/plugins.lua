local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update",  key = "u" },
	{ cmd = "sync",    key = "s" },
	{ cmd = "clean",   key = "cl" },
	{ cmd = "check",   key = "ch" },
	{ cmd = "log",     key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
	{ cmd = "profile", key = "p" },
}
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = "<SPC>" .. v.key
	lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
end
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })

require("lazy").setup({
	require("plugins.telescope").config,
	require("plugins.fzf"),
	require("plugins.ui"),
	require("plugins.statusline"),
	require("plugins.editor"),
	require("plugins.scrollbar"),
	require("plugins.tabline"),
	require("plugins.autocomplete").config,
	require("plugins.fff"),
	require("plugins.debugger"),
	require("plugins.lsp"),
	require("plugins.flutter"),
	require("plugins.go"),
	require("plugins.treesitter"),
	require("plugins.comment"),
	require("plugins.surround"),
	require("plugins.project"),
	require("plugins.wilder"),
	require("plugins.multi-cursor"),
	require("plugins.copilot"),
	require("plugins.markdown"),
	require("plugins.git"),
	-- require("plugins.indent"),
	require("plugins.search"),
	require("plugins.yank"),
	require("plugins.snippets"),
	require("plugins.window-management"),
	require("plugins.undo"),
	require("plugins.ft"),
	require("plugins.fun"),
	require("plugins.winbar"),
	require("plugins.leap"),
	require("plugins.tex"),
	require("plugins.yazi"),
	{ "dstein64/vim-startuptime" },
}, {
})

require("custom_plugins.vertical_cursor_movement")

local swap_ternary = require("custom_plugins.swap_ternary")
vim.keymap.set("n", "<leader>st", swap_ternary.swap_ternary, { noremap = true })

require("custom_plugins.compile_run")
