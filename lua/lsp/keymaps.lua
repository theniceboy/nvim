local M = {}

-- Global LSP keymaps (already exist in Neovim 0.11)
function M.setup_global()
	-- These are automatically set up by Neovim 0.11
	-- We'll add any additional global LSP keymaps here if needed
end

-- Buffer-specific LSP keymaps (set on LspAttach)
function M.setup(bufnr)
	bufnr = bufnr or 0 -- Default to current buffer if not provided
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Definitions, references, etc.
	vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('i', '<c-f>', function()
		local bufnr = bufnr or 0
		local ft = vim.bo[bufnr].filetype
		for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
			if client.supports_method and client:supports_method('textDocument/signatureHelp') then
				if not (client.name == 'terraformls' and (ft == 'hcl' or ft == 'terraform-vars')) then
					return vim.lsp.buf.signature_help()
				end
			end
		end
		-- No eligible client: do nothing silently
	end, opts)

	-- Workspace management
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)

	-- Diagnostics
	vim.keymap.set('n', '<leader>-', function() vim.diagnostic.jump({ count = -1 }) end, opts)
	vim.keymap.set('n', '<leader>=', function() vim.diagnostic.jump({ count = 1 }) end, opts)
	vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)

	-- Format document
	vim.keymap.set('n', '<leader>f', function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

return M
