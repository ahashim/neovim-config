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


-- On Attach
local function on_attach(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  require('mappings').lspconfig()
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
