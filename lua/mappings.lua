----- MAPPINGS -----

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

-- GENERAL
map {"n", "<C-a>", ":%y+ <CR>"} -- copy entire file content
map {'n', '<Esc>', ':noh <CR>'} -- clear search highlight
map {'n', '<Leader>w', ':write<CR>'} -- quick save
map {'n', '<Leader>q', ':q<CR>'} -- quick close
map {"n", "<Leader>n", ":set nu! <CR>"} -- toggle numbers


-- BUFFERS/TABS
map {"n", "<S-t>", ":enew <CR>"} -- new buffer
map {"n", "<C-t>b", ":tabnew <CR>"} -- new tab


-- NAVIGATION
-- allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
map {'', "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }
map {'', "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {'', "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }


-- TERMINAL
map{"t", "jk", "<C-\\><C-n>"} -- get out of terminal mode
-- map{"t", { "JK" }, "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>") -- hide a term from within terminal mode
map{"n", "<leader>W", ":Telescope terms <CR>"} -- pick a hidden term
map{"n", "<leader>h", ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>"} -- new horizontal terminal
map{"n", "<leader>v", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>"} -- new vertical terminal
map{"n", "<leader>w", ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>"} -- new terminal window
