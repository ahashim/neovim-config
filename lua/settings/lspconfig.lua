-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = {
  'markdown',
  'plaintext'
}
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
  valueSet = { 1 }
}


-- Diagnostics
vim.diagnostic.config {
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = {
    prefix = '',
    spacing = 0,
  },
}


-- Handlers
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'single' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'single'}
)


-- Notifications
vim.notify = function(msg, log_level)
  -- suppress errors from LSP server
  if msg:match 'exit code' then
    return
  end

  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end


-- Symbols
local function lspSymbol(name, icon)
  local hl = 'DiagnosticSign' .. name

  vim.fn.sign_define(hl, {
    numhl = hl,
    text = icon,
    texthl = hl
  })
end

lspSymbol('Error', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')


-- Initialize Servers
require('nvim-lsp-installer').on_server_ready(function(server)
  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

  -- Sensible defaults
  local opts = {
    capabilities = capabilities,
    on_attach = function()
      -- Enable completion triggered by <c-x><c-o>
      vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Mappings
      require('mappings').lspconfig()
    end,
    root_dir = vim.loop.cwd,
  }

  -- Lua
  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      }
    }
  end

  server:setup(opts)
end)
