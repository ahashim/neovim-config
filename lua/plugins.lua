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
    after = 'nvim-web-devicons',
    config = function()
      require('settings.bufferline')
    end,
    setup = function()
       require('mappings').bufferline()
    end,
  }

  -- BufDelete
  use {
    'ojroques/nvim-bufdel',
    config = function()
      require('settings.bufdelete')
    end,
    setup = function()
      require('mappings').bufdelete()
    end
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('settings.colorizer')
    end,
  }

  -- Dashboard
   use {
      'glepnir/dashboard-nvim',
      config = function()
        require('settings.dashboard')
      end,
      setup = function()
        require('mappings').dashboard()
      end,
   }

  -- DevIcons
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('settings.devicons');
    end,
  }

  -- Fugitive
  use 'tpope/vim-fugitive'

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('settings.gitsigns')
    end
  }

  -- Indent Blankline
  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'dashboard-nvim',
    config = function()
      require('settings.indent-blankline')
    end,
  }

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    after = 'nvim-web-devicons',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFocus'
    },
    config = function()
      require('settings.nvimtree')
    end,
    setup = function()
      require('mappings').nvimtree()
    end,
  }

  -- OneDark
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('settings.onedark');
    end,
  }

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Plenary
  use 'nvim-lua/plenary.nvim'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('settings.statusline')
    end,
  }

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
    cmd = 'Telescope',
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
