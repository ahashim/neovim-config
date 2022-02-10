# neovim-config

[![neovim preview](https://gateway.pinata.cloud/ipfs/QmamHwPGgpDQGRwvR7SVZXmScBxUv43nd6N4QjtUNPgwLK?preview=1 "neovim preview")](https://gateway.pinata.cloud/ipfs/QmamHwPGgpDQGRwvR7SVZXmScBxUv43nd6N4QjtUNPgwLK?preview=1)

A modern config for [neovim](https://neovim.io/) focused on developer experience. Featuring language server support, syntax highlighting, terminal windows, git integration, and [a few other things.](https://github.com/ahashim/neovim-config/blob/main/lua/plugins.lua)

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

## Mappings

Commonly used mappings in this config. [View the full list here](https://github.com/ahashim/neovim-config/blob/main/lua/mappings.lua#L27).

| Shortcut                  | Mode                  | Description                                                                 |
| ------------------------- | --------------------- | --------------------------------------------------------------------------- |
| <kbd>Space db</kbd>       | Normal                | Dashboard                                                                   |
| <kbd>Space fn</kbd>       | Normal                | New File                                                                    |
| <kbd>Space w</kbd>        | Normal                | Save                                                                        |
| <kbd>Space q</kbd>        | Normal                | Quit                                                                        |
| <kbd>Shift + t</kbd>      | Normal                | New Buffer                                                                  |
| <kbd>Tab</kbd>            | Normal                | Next Buffer                                                                 |
| <kbd>Shift + Tab</kbd>    | Normal                | Previous Buffer                                                             |
| <kbd>Ctrl + t</kbd>       | Normal                | New Tab                                                                     |
| <kbd>Ctrl + n</kbd>       | Normal                | Toggle directory tree view                                                  |
| <kbd>Space e</kbd>        | Normal                | View current file in directory tree view                                    |
| <kbd>Ctrl + a</kbd>       | Normal                | Copy entire file content                                                    |
| <kbd>Esc</kbd>            | Normal                | Clear search highlight                                                      |
| <kbd>Space /</kbd>        | Normal                | Toggle comment                                                              |
| <kbd>Space h</kbd>        | Normal                | New Horizontal Terminal                                                     |
| <kbd>Space v</kbd>        | Normal                | New Vertical Terminal                                                       |
| <kbd>jk</kbd>             | Terminal              | Exit Terminal Mode                                                          |
| <kbd>gd</kbd>             | Normal                | Goes to definition of the symbol under the cursor                           |
| <kbd>Space l</kbd>        | Normal                | View buffer errors/warnings/info location list                              |
| <kbd>Space fb</kbd>       | Normal                | Telescope find in all buffers                                               |
| <kbd>Space fa</kbd>       | Normal                | Telescope find in all files                                                 |
| <kbd>Space ff</kbd>       | Normal                | Telescope find in all files (exluding hidden files & those in .gitignore)   |
| <kbd>Space cm</kbd>       | Normal                | Telescope view git commits                                                  |
| <kbd>Space gt</kbd>       | Normal                | Telescope view git status                                                   |
| <kbd>Space hb</kbd>       | Normal                | Git blame current line                                                      |

## Roadmap
- Add auto-formatter [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim).
- Improve diagnostic loclist with [trouble](https://github.com/folke/trouble.nvim).
- Use a smarter terminal plugin like [toggleterm](https://github.com/akinsho/toggleterm.nvim)
