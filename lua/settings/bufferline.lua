local theme = require('theme')

local present, bufferline = pcall(require, 'bufferline')
if not present then
  return
end

bufferline.setup({
  options = {
    always_show_bufferline = true,
    buffer_close_icon = '',
    close_icon = '',
    custom_filter = function(buf_number)
      -- Filter out managed/persistent split terms
      local present_type, type = pcall(function()
        return vim.api.nvim_buf_get_var(buf_number, 'term_type')
      end)

      if present_type then
        if type == 'vert' or type == 'hori' then
          return false
        end

        return true
      end

      return true
    end,
    diagnostics = false,
    enforce_regular_tabs = false,
    left_trunc_marker = '',
    max_name_length = 14,
    max_prefix_length = 13,
    modified_icon = '',
    offsets = {
      {
        filetype = 'NvimTree',
        text = '',
        padding = 1,
      },
    },
    right_trunc_marker = '',
    separator_style = 'thin',
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    tab_size = 20,
    view = 'multiwindow',
  },
  highlights = {
    background = {
      guifg = theme.get('grey_fg'),
      guibg = theme.get('black2'),
    },

    -- Buffers
    buffer_selected = {
      guifg = theme.get('white'),
      guibg = theme.get('black'),
      gui = 'bold',
    },
    buffer_visible = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('black2'),
    },

    -- Diagnostics (nvim_lsp)
    error = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('black2'),
    },
    error_diagnostic = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('black2'),
    },

    -- Close buttons
    close_button = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('black2'),
    },
    close_button_visible = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('black2'),
    },
    close_button_selected = {
      guifg = theme.get('red'),
      guibg = theme.get('black'),
    },
    fill = {
      guifg = theme.get('grey_fg'),
      guibg = theme.get('black2'),
    },
    indicator_selected = {
      guifg = theme.get('black'),
      guibg = theme.get('black'),
    },

    -- Modified
    modified = {
      guifg = theme.get('red'),
      guibg = theme.get('black2'),
    },
    modified_visible = {
      guifg = theme.get('red'),
      guibg = theme.get('black2'),
    },
    modified_selected = {
      guifg = theme.get('green'),
      guibg = theme.get('black'),
    },

    -- Separators
    separator = {
      guifg = theme.get('black2'),
      guibg = theme.get('black2'),
    },
    separator_visible = {
      guifg = theme.get('black2'),
      guibg = theme.get('black2'),
    },
    separator_selected = {
      guifg = theme.get('black2'),
      guibg = theme.get('black2'),
    },

    -- Tabs
    tab = {
      guifg = theme.get('light_grey'),
      guibg = theme.get('one_bg3'),
    },
    tab_selected = {
      guifg = theme.get('black2'),
      guibg = theme.get('nord_blue'),
    },
    tab_close = {
      guifg = theme.get('red'),
      guibg = theme.get('black'),
    },
  },
})
