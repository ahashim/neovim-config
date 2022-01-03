local config = require('nvim-treesitter.configs')

config.setup {
  ensure_installed = {
    'bash',
    'cpp',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'go',
    'graphql',
    'http',
    'lua',
    'make',
    'php',
    'python',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  }
}
