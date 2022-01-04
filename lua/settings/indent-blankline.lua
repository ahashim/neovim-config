require('indent_blankline').setup {
  buftype_exclude = {
    'terminal'
  },
  char = '▏',
  filetype_exclude = {
     'help',
     'terminal',
     'dashboard',
     'packer',
     'lspinfo',
     'TelescopePrompt',
     'TelescopeResults',
     '',
  },
  indentLine_enabled = 1,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
}

