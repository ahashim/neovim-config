----- PLUGINS -----
local packer = require('packer')

packer.init {
  auto_clean = true,
  compile_on_sync = true,
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
  git = {
    clone_timeout = 6000, -- seconds
  },
}

return packer.startup(function()
  -- Packer 
  use 'wbthomason/packer.nvim'
  
  -- Plenary 
  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'plugins.treesitter'
    end,
    event = 'BufRead',
    run = ':TSUpdate'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      }, 
      {
        'nvim-telescope/telescope-media-files.nvim',
        setup = function()
          media_files = '<leader>fp'
        end,
      },
    }
  }
end)
