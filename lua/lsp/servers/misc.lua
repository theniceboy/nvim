local M = {}

function M.setup()
	-- YAML Language Server with CloudFormation support
	vim.lsp.config('yamlls', {
		cmd = { 'yaml-language-server', '--stdio' },
		filetypes = { 'yaml', 'yaml.docker-compose' },
		root_markers = { '.git' },
		settings = {
			redhat = {
				telemetry = {
					enabled = false
				}
			},
			yaml = {
				schemaStore = {
					enable = true,
					url = "",
				},
				schemas = require('schemastore').yaml.schemas(),
				validate = true,
				customTags = {
					"!fn",
					"!And",
					"!If",
					"!Not",
					"!Equals",
					"!Or",
					"!FindInMap sequence",
					"!Base64",
					"!Cidr",
					"!Ref",
					"!Sub",
					"!GetAtt",
					"!GetAZs",
					"!ImportValue",
					"!Select",
					"!Split",
					"!Join sequence"
				}
			},
		}
	})


	-- Terraform Language Server
	vim.lsp.config('terraformls', {
		cmd = { 'terraform-ls', 'serve' },
		-- Restrict to Terraform files only; terraform-ls is not a general HCL server.
		filetypes = { 'terraform' },
		root_markers = { '.terraform', '.git' },
	})

	-- Ansible filetype detection
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = {
			"*/playbooks/*.yml",
			"*/playbooks/*.yaml",
			"*/roles/*/tasks/*.yml",
			"*/roles/*/tasks/*.yaml",
			"*/roles/*/handlers/*.yml",
			"*/roles/*/handlers/*.yaml",
			"*/group_vars/*",
			"*/host_vars/*"
		},
		callback = function()
			vim.bo.filetype = "yaml.ansible"
		end
	})

	-- Ansible Language Server
	vim.lsp.config('ansiblels', {
		cmd = { 'ansible-language-server', '--stdio' },
		filetypes = { 'yaml.ansible', 'ansible' },
		root_markers = { 'ansible.cfg', 'playbook.yml', 'site.yml', 'hosts', 'inventory', '.git' },
		settings = {
			ansible = {
				validation = {
					enabled = true,
					lint = {
						enabled = false
					}
				},
				executionEnvironment = {
					enabled = false
				}
			}
		}
	})

	-- TOML Language Server
	vim.lsp.config('taplo', {
		cmd = { 'taplo', 'lsp', 'stdio' },
		filetypes = { 'toml' },
		root_markers = { 'Cargo.toml', 'pyproject.toml', '.git' },
	})

	-- Prisma Language Server
	vim.lsp.config('prismals', {
		cmd = { 'prisma-language-server', '--stdio' },
		filetypes = { 'prisma' },
		root_markers = { 'package.json', '.git' },
	})

	-- Docker Language Server
	vim.lsp.config('dockerls', {
		cmd = { 'docker-langserver', '--stdio' },
		filetypes = { 'dockerfile' },
		root_markers = { 'Dockerfile', '.git' },
	})

	-- C/C++ Language Server
	vim.lsp.config('clangd', {
		cmd = { 'clangd' },
		filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
		root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
	})

	-- Enable the servers
	vim.lsp.enable('yamlls')
	vim.lsp.enable('terraformls')
	vim.lsp.enable('ansiblels')
	vim.lsp.enable('taplo')
	vim.lsp.enable('prismals')
	vim.lsp.enable('dockerls')
	vim.lsp.enable('clangd')

	-- Custom autocmds from old config
	-- Terraform/HCL specific formatting
	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		pattern = { "*.tf", "*.tfvars" },
		callback = function()
			vim.lsp.buf.format()
		end,
	})

	-- Packer formatting for Packer HCL only
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "*.pkr.hcl", "*.pkrvars.hcl" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local filename = vim.api.nvim_buf_get_name(bufnr)
			vim.fn.system(string.format("packer fmt %s", vim.fn.shellescape(filename)))
			vim.cmd("edit!")
		end,
	})
end

return M
