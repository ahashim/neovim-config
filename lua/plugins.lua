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
  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    after = "nvim-web-devicons",
    config = function()
      require('settings.bufferline')
    end,
    setup = function()
       require(".mappings").bufferline()
    end,
  }

  -- DevIcons 
  use 'kyazdani42/nvim-web-devicons'
  config = function()
    require('settings.devicons');
  end

  -- OneDark
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('settings.onedark');
    end
  }
  
  -- Packer 
  use 'wbthomason/packer.nvim'
  
  -- Plenary 
  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('settings.treesitter')
    end,
    event = 'BufRead',
    run = ':TSUpdate'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require('settings.telescope')
    end,
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
    },
    setup = function()
      require('mappings').telescope()
    end,
  }
end)
