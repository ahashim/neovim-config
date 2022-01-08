----- CORE MAPPINGS -----

local map = function(key)
  local mode = key[1] -- vim mode (normal, visual, etc..)
  local lhs = key[2] -- left-hand-side (mapping)
  local rhs = key[3] -- right-hand-side (macro)

  -- sensible defaults
  local opts = {noremap = true}

  -- get any extra options
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

-- General
map {'n', '<C-a>', ':%y+ <CR>'} -- copy entire file content
map {'n', '<Esc>', ':noh <CR>'} -- clear search highlight
map {'n', '<Leader>w', ':write<CR>'} -- quick save
map {'n', '<Leader>q', ':quit!<CR>'} -- quick close
map {'n', '<Leader>n', ':set nu! <CR>'} -- toggle numbers


-- Buffers/Tabs
map {'n', '<S-t>', ':enew <CR>'} -- new buffer
map {'n', '<C-t>b', ':tabnew <CR>'} -- new tab


-- Navigation
-- allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
map {'', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }
map {'', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }


-- Terminal
map {'t', 'jk', '<C-\\><C-n>'} -- get out of terminal mode
map {'n', '<leader>T', ':Telescope terms <CR>'} -- pick a hidden term
map {'n', '<leader>h', ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>"} -- new horizontal terminal
map {'n', '<leader>v', ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>"} -- new vertical terminal



----- PLUGIN MAPPINGS -----

-- Called as functions here instead of being in their own
-- settings files, so we can reuse the local map function.

return {
  -- Bufferline
  bufferline = function()
    map {'n', '<TAB>', ':BufferLineCycleNext <CR>'}
    map {'n', '<S-Tab>', ':BufferLineCyclePrev <CR>'}
  end,

  -- BufDelete
  bufdelete = function()
    map {'n', '<S-x>', ':BufDel <CR>'}
  end,

  -- Dashboard
  dashboard = function()
    map {'n', '<leader>db', ':Dashboard <CR>'}
    map {'n', '<leader>fn', ':DashboardNewFile <CR>'}
  end,

  -- Language Server
  lspconfig = function()
    local commands = {
      declaration =             'gD',
      definition =              'gd',
      hover =                   'K',
      implementation =          'gi',
      signature_help =          'gk',
      add_workspace_folder =    '<leader>wa',
      remove_workspace_folder = '<leader>wr',
      list_workspace_folders =  '<leader>wl',
      type_definition =         '<leader>D',
      rename =                  '<leader>rn',
      code_action =             '<leader>ca',
      references =              'gr',
      float_diagnostics =       'ge',
      goto_prev =               '[d',
      goto_next =               ']d',
      set_loclist =             '<leader>l',
      formatting =              '<leader>fm',
   },

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    map {'n', commands.declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>'}
    map {'n', commands.definition, '<cmd>lua vim.lsp.buf.definition()<CR>'}
    map {'n', commands.hover, '<cmd>lua vim.lsp.buf.hover()<CR>'}
    map {'n', commands.implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>'}
    map {'n', commands.signature_help, '<cmd>lua vim.lsp.buf.signature_help()<CR>'}
    map {'n', commands.add_workspace_folder, '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'}
    map {'n', commands.remove_workspace_folder, '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'}
    map {'n', commands.list_workspace_folders, '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'}
    map {'n', commands.type_definition, '<cmd>lua vim.lsp.buf.type_definition()<CR>'}
    map {'n', commands.rename, '<cmd>lua vim.lsp.buf.rename()<CR>'}
    map {'n', commands.code_action, '<cmd>lua vim.lsp.buf.code_action()<CR>'}
    map {'n', commands.references, '<cmd>lua vim.lsp.buf.references()<CR>'}
    map {'n', commands.float_diagnostics, '<cmd>lua vim.diagnostic.open_float()<CR>'}
    map {'n', commands.goto_prev, '<cmd>lua vim.diagnostic.goto_prev()<CR>'}
    map {'n', commands.goto_next, '<cmd>lua vim.diagnostic.goto_next()<CR>'}
    map {'n', commands.set_loclist, '<cmd>lua vim.diagnostic.setloclist()<CR>'}
    map {'n', commands.formatting, '<cmd>lua vim.lsp.buf.formatting()<CR>'}
  end,

  -- NvimTree
  nvimtree = function()
    map {'n', '<C-n>', ':NvimTreeToggle <CR>'}
    map {'n', '<leader>e', ':NvimTreeFocus <CR>'}
  end,

  -- Telescope
  telescope = function()
    map {'n', '<leader>fb', ':Telescope buffers <CR>'} -- buffers
    map {'n', '<leader>ff', ':Telescope find_files <CR>'} -- files
    map {'n', '<leader>fa', ':Telescope find_files no_ignore=true hidden=true <CR>'} -- hidden files
    map {'n', '<leader>cm', ':Telescope git_commits <CR>'} -- git commits
    map {'n', '<leader>gt', ':Telescope git_status <CR>'} -- git statuses
    map {'n', '<leader>fh', ':Telescope help_tags <CR>'} -- help tags
    map {'n', '<leader>fw', ':Telescope live_grep <CR>'} -- live grep
    map {'n', '<leader>fo', ':Telescope oldfiles <CR>'} -- old files
  end,
}
