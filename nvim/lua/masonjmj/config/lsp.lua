local ok, mason = pcall(require, "mason")
if not ok then
	vim.notify("Mason couldn't be installed!", "error")
	return
end

local ok2, mason_config = pcall(require, "mason-lspconfig")
if not ok2 then
	vim.notify("Mason config couldn't be installed!", "error")
	return
end

local ok3, lspconfig = pcall(require, "lspconfig")
if not ok3 then
	vim.notify("Lspconfig couldn't be installed!", "error")
	return
end

local ok4, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not ok4 then
	vim.notify("Cmp lsp couldn't be installed!", "error")
	return
end

local capabilities = cmp_lsp.default_capabilities()

local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

mason.setup()
mason_config.setup()

mason_config.setup_handlers {
	function(server_name)
		lspconfig[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}
	end,
	["rust_analyzer"] = function()
		lspconfig.rust_analyzer.setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy"
					}
				}
			}
		}
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

vim.diagnostic.config({
	float = {
		border = 'rounded',
	},
})
-- Make diagnostic floats look better
vim.cmd [[highlight! link FloatBorder Normal ]]
vim.cmd [[highlight! link NormalFloat Normal]]
