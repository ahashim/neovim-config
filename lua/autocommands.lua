----- AUTOCOMMANDS -----

local cmd = vim.cmd

-- Remove trailing whitespace from files on save
cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]

-- Hide status line on certain windows
cmd [[ autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require('autocommands').hide_statusline() ]]

-- Hide line numbers in terminal windows
cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Open a file from its last left off position
cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- File extension specific tabbing
cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]

-- Packer
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return {
  hide_statusline = function()
    local api = vim.api
    local buftype = api.nvim_buf_get_option('%', 'ft')
    local hidden = {
      'help',
      'dashboard',
      'NvimTree',
      'terminal',
    }

    if vim.tbl_contains(hidden, buftype) then
      api.nvim_set_option('laststatus', 0)
      return
    end

    api.nvim_set_option('laststatus', 2)
  end
}
