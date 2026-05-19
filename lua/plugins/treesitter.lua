local parsers = {
	"markdown",
	"markdown_inline",
	"html",
	"javascript",
	"typescript",
	"tsx",
	"query",
	"dart",
	"java",
	"c",
	"prisma",
	"bash",
	"go",
	"lua",
	"kdl",
	"vim",
	"hcl",
	"terraform",
	"dockerfile",
	"yaml",
	"python",
}

local filetypes = {
	"markdown",
	"html",
	"javascript",
	"typescript",
	"typescriptreact",
	"tsx",
	"query",
	"dart",
	"java",
	"c",
	"prisma",
	"bash",
	"sh",
	"zsh",
	"go",
	"lua",
	"kdl",
	"vim",
	"hcl",
	"terraform",
	"dockerfile",
	"yaml",
	"python",
}

local indent_disabled = {
	dart = true,
	yaml = true,
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		priority = 1000,
		build = function()
			local treesitter = require("nvim-treesitter")
			treesitter.install(parsers, { summary = true }):wait(300000)
			treesitter.update(parsers, { summary = true }):wait(300000)
		end,
		config = function()
			vim.opt.smartindent = false

			require("nvim-treesitter").setup({})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)

					if indent_disabled[vim.bo[args.buf].filetype] then
						vim.bo[args.buf].indentexpr = ""
						return
					end

					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local tscontext = require('treesitter-context')
			tscontext.setup {
				enable = true,
				max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
				trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			}
			vim.keymap.set("n", "[c", function()
				tscontext.go_to_context()
			end, { silent = true })
		end
	},
}
