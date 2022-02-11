-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- Diagnostics
vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = false,
	virtual_text = {
		prefix = "",
		spacing = 0,
	},
})

-- Handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

-- Notifications
vim.notify = function(msg, log_level)
	-- suppress errors from LSP server
	if msg:match("exit code") then
		return
	end

	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

--- Symbols
local function lspSymbol(name, icon)
	local hl = "DiagnosticSign" .. name

	vim.fn.sign_define(hl, {
		numhl = hl,
		text = icon,
		texthl = hl,
	})
end

lspSymbol("Error", "")
lspSymbol("Hint", "")
lspSymbol("Info", "")
lspSymbol("Warn", "")

local function on_attach()
	-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end
-- Initialize Servers
require("nvim-lsp-installer").on_server_ready(function(server)
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

	-- Sensible defaults
	local opts = {
		capabilities = capabilities,
		flags = {
			lspdebounce_text_changes = 150,
		},
		on_attach = on_attach,
		root_dir = vim.loop.cwd,
	}

	local enhanced_server_opts = {
		["sumneko_lua"] = function(options)
			options.settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
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
			}
		end,
		["stylelint_lsp"] = function(options)
			options.on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end
		end,
		["tsserver"] = function(options)
			options.on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end
		end,
	}

	if enhanced_server_opts[server.name] then
		enhanced_server_opts[server.name](opts)
	end

	server:setup(opts)
end)
