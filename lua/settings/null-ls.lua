local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')

-- custom sources
local custom = {
  diagnostics = {
    solhint = { -- https://protofire.github.io/solhint
      filetypes = { 'solidity' },
      generator = helpers.generator_factory({
        args = {
          '$FILENAME',
          '--formatter',
          'unix',
        },
        command = 'solhint',
        format = 'line',
        multiple_files = true,
        on_output = helpers.diagnostics.from_pattern('([^:]+):([%d]+):([%d]+): (.*) %[([%a]+)/([^]]+)%]', {
          'filename',
          'row',
          'col',
          'message',
          'severity',
          'code',
        }),
      }),
      method = null_ls.methods.DIAGNOSTICS,
      name = 'solhint',
    },
  },
}

-- full source list
local sources = {
  -- code actions
  null_ls.builtins.code_actions.gitsigns,

  -- completion
  null_ls.builtins.completion.luasnip,

  -- diagnostics
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.golangci_lint,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.php,
  null_ls.builtins.diagnostics.stylelint,
  custom.diagnostics.solhint,

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
  sources = sources,
})
