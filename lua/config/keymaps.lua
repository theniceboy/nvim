vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = "S",             to = ":w<CR>" },
	{ from = "Q",             to = ":q<CR>" },
	{ from = ";",             to = ":",                                                                   mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "`",             to = "~",                                                                   mode = mode_nv },

	-- Movement
	{ from = "u",             to = "k",                                                                   mode = mode_nv },
	{ from = "e",             to = "j",                                                                   mode = mode_nv },
	{ from = "n",             to = "h",                                                                   mode = mode_nv },
	{ from = "i",             to = "l",                                                                   mode = mode_nv },
	{ from = "U",             to = "5k",                                                                  mode = mode_nv },
	{ from = "E",             to = "5j",                                                                  mode = mode_nv },
	{ from = "N",             to = "0",                                                                   mode = mode_nv },
	{ from = "I",             to = "$",                                                                   mode = mode_nv },
	{ from = "gu",            to = "gk",                                                                  mode = mode_nv },
	{ from = "ge",            to = "gj",                                                                  mode = mode_nv },
	{ from = "h",             to = "e",                                                                   mode = mode_nv },
	{ from = "<C-U>",         to = "5<C-y>",                                                              mode = mode_nv },
	{ from = "<C-E>",         to = "5<C-e>",                                                              mode = mode_nv },
	{ from = "ci",            to = "cl", },
	{ from = "cn",            to = "ch", },
	{ from = "ck",            to = "ci", },
	{ from = "c,.",           to = "c%", },
	{ from = "yh",            to = "ye", },

	-- Actions
	{ from = "l",             to = "u" },
	{ from = "k",             to = "i",                                                                   mode = mode_nv },
	{ from = "K",             to = "I",                                                                   mode = mode_nv },

	-- Useful actions
	{ from = ",.",            to = "%",                                                                   mode = mode_nv },
	{ from = "<c-y>",         to = "<ESC>A {}<ESC>i<CR><ESC>ko",                                          mode = mode_i },
	{ from = "\\v",           to = "v$h", },
	{ from = "<c-a>",         to = "<ESC>A",                                                              mode = mode_i },

	-- Window & splits
	{ from = "<leader>w",     to = "<C-w>w", },
	{ from = "<leader>u",     to = "<C-w>k", },
	{ from = "<leader>e",     to = "<C-w>j", },
	{ from = "<leader>n",     to = "<C-w>h", },
	{ from = "<leader>i",     to = "<C-w>l", },
	{ from = "qf",            to = "<C-w>o", },
	{ from = "s",             to = "<nop>", },
	{ from = "su",            to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
	{ from = "se",            to = ":set splitbelow<CR>:split<CR>", },
	{ from = "sn",            to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
	{ from = "si",            to = ":set splitright<CR>:vsplit<CR>", },
	{ from = "<up>",          to = ":res +5<CR>", },
	{ from = "<down>",        to = ":res -5<CR>", },
	{ from = "<left>",        to = ":vertical resize-5<CR>", },
	{ from = "<right>",       to = ":vertical resize+5<CR>", },
	-- { from = "sh",            to = "se", },
	-- { from = "sh",            to = "<C-w>t<C-w>K", },
	-- { from = "sv",            to = "<C-w>t<C-w>H", },
	{ from = "srh",           to = "<C-w>b<C-w>K", },
	{ from = "srv",           to = "<C-w>b<C-w>H", },

	-- Tab management
	{ from = "tu",            to = ":tabe<CR>", },
	{ from = "tU",            to = ":tab split<CR>", },
	{ from = "tn",            to = ":-tabnext<CR>", },
	{ from = "ti",            to = ":+tabnext<CR>", },
	{ from = "tmn",           to = ":-tabmove<CR>", },
	{ from = "tmi",           to = ":+tabmove<CR>", },

	-- Other
	{ from = "<leader>sw",    to = ":set wrap<CR>" },
	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
	{ from = "<f10>",         to = ":TSHighlightCapturesUnderCursor<CR>" },
	{ from = "<leader>o",     to = "za" },
	{ from = "<leader>pr",    to = ":profile start profile.log<CR>:profile func *<CR>:profile file *<CR>" },
	{ from = "<leader>rc",    to = ":e ~/.config/nvim/init.lua<CR>" },
	{ from = "<leader>rv",    to = ":e .vim.lua<CR>" },
	{ from = ",v",            to = "v%" },
	{ from = "<leader><esc>", to = "<nop>" },

	-- Joshuto
	{ from = "R",             to = ":Joshuto<CR>" },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end

-- close win below
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("TroubleClose")
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins > 1 then
		run_vim_shortcut([[<C-w>j:q<CR>]])
	end
end, { noremap = true, silent = true })
