# neovim-config
A modern config for [neovim](https://neovim.io/) focused on developer experience, featuring:

- Language server support
- Syntax highlighting
- Terminal windows
- Git integration

and [a few other things.](https://github.com/ahashim/neovim-config/blob/main/lua/plugins.lua)

## Requirements

- [neovim](https://neovim.io/) version 0.6.0 or above.
- `:checkhealth` returns all green.

## File Structure

```
nvim
├── init.lua                  # initialization
└── lua/                      # neovim config files
    ├── autocommands.lua
    ├── core.lua
    ├── mappings.lua
    ├── plugins.lua
    ├── theme.lua
    └── settings/             # plugin settings
        ├── bufdelete.lua
        ├── bufferline.lua
        ├── colorizer.lua
        ├── comment.lua
        ├── dashboard.lua
        ├── devicons.lua
        ├── gitsigns.lua
        ├── indent-blankline.lua
        ├── lspconfig.lua
        ├── lspkind_icons.lua
        ├── lspsignature.lua
        ├── luasnip.lua
        ├── nvim-cmp.lua
        ├── nvimtree.lua
        ├── onedark.lua
        ├── statusline.lua
        ├── telescope.lua
        └── treesitter.lua
```
