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

-- quick save
map {'n', '<Leader>w', ':write<CR>'}

-- quick close
map {'n', '<Leader>q', ':q<CR>'}

-- clear search highlighting with Esc
map {'n', '<Esc>', ':noh <CR>'}

-- copy whole file content
map {"n", "<C-a>", ":%y+ <CR>"} 

-- new buffer
map {"n", "<S-t>", ":enew <CR>"}

-- new tab
map {"n", "<C-t>b", ":tabnew <CR>"}

-- toggle numbers
map {"n", "<leader>n", ":set nu! <CR>"}

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
map {"", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {"", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }
map {"", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',  expr = true }
map {"", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',  expr = true }
