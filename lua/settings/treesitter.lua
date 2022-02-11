require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
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
    'toml',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
})
