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
