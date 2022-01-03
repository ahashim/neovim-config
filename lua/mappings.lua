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
map {'n', '<Leader>q', ':q<CR>'} -- quick close
map {'n', '<Leader>n', ':set nu! <CR>'} -- toggle numbers


-- Buffers/Tabs 
map {'n', '<S-t>', ':enew <CR>'} -- new buffer
map {'n', '<C-t>b', ':tabnew <CR>'} -- new tab


-- Navigation
-- allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
map {'', "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }
map {'', "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }


-- Terminal
map {"t", "jk", "<C-\\><C-n>"} -- get out of terminal mode
--  map{"t", { "JK" }, "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>") -- hide a term from within terminal mode
map {"n", "<leader>T", ":Telescope terms <CR>"} -- pick a hidden term
map {"n", "<leader>h", ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>"} -- new horizontal terminal
map {"n", "<leader>v", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>"} -- new vertical terminal


----- PLUGIN MAPPINGS -----

return {
  -- Bufferline
  bufferline = function()
    map {'n', '<TAB>', ':BufferLineCycleNext <CR>'}
    map {'n', '<S-Tab>', ':BufferLineCyclePrev <CR>'}
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
