local null_ls = require('null-ls')

-- full source list
local my_sources = {
  -- code actions
  null_ls.builtins.code_actions.gitsigns,

  -- completion
  null_ls.builtins.completion.luasnip,

  -- diagnostics
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.php,
  null_ls.builtins.diagnostics.solhint,
  null_ls.builtins.diagnostics.stylelint,

  -- formatting
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.fixjson,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.phpcsfixer,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.rustywind,
  null_ls.builtins.formatting.sqlformat,
  null_ls.builtins.formatting.stylelint,
  null_ls.builtins.formatting.stylua,
}

null_ls.setup({
  on_attach = function(client)
    -- auto format on save
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
    end
  end,
  sources = my_sources,
})
