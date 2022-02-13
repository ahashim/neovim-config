require('lspsaga').setup({
  -- general
  debug = false,
  border_style = 'single',
  max_preview_lines = 20,
  server_filetype_map = {},

  -- code actions
  code_action_icon = '🗲 ',
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 1,
    virtual_text = true,
  },

  -- definition
  definition_preview_icon = ' ',

  -- diagnostics
  use_saga_diagnostic_sign = true,
  diagnostic_prefix_format = '%d. ',
  diagnostic_header_icon = '   ',
  error_sign = '',
  hint_sign = '',
  infor_sign = '',
  warn_sign = '',

  -- finder
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = 'q',
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },

  -- rename
  rename_action_keys = {
    quit = '<C-c>',
    exec = '<CR>',
  },
  rename_prompt_prefix = '➤',
})
