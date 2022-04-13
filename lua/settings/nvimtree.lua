local nvimtree = require('nvim-tree')
local global = vim.g

-- nvimtree options need to be applied in global scope before initialization
global.nvim_tree_add_trailing = 0
global.nvim_tree_git_hl = 0
global.nvim_tree_highlight_opened_files = 0
global.nvim_tree_icons = {
  default = '',
  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    empty = '',
    empty_open = '',
    open = '',
    symlink = '',
    symlink_open = '',
  },
  git = {
    deleted = '',
    ignored = '◌',
    renamed = '➜',
    staged = '✓',
    unmerged = '',
    unstaged = '✗',
    untracked = '★',
  },
  symlink = '',
}
global.nvim_tree_root_folder_modifier = table.concat({
  ':t:gs?$?/..',
  string.rep(' ', 1000),
  '?:gs?^??',
})
global.nvim_tree_show_icons = {
  folders = 1,
  files = 1,
  git = 0,
}

nvimtree.setup({
  actions = {
    open_file = {
      quit_on_open = 0,
      window_picker = {
        exclude = {
          filetype = { 'notify', 'packer', 'qf' },
          buftype = { 'terminal' },
        },
      },
    },
  },
  auto_close = false,
  disable_netrw = true,
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
  hijack_cursor = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { 'dashboard' },
  open_on_tab = false,
  renderer = {
    indent_markers = {
      enable = false,
    },
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    allow_resize = true,
    side = 'left',
    width = 25,
    hide_root_folder = true,
  },
})
