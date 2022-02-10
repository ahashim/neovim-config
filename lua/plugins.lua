----- PLUGINS -----
local packer = require('packer')
local use = packer.use

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

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('settings.comment')
    end,
    setup = function()
      require('mappings').comment()
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('settings.nvim-cmp')
    end
  }
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

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
  use {
    'tpope/vim-fugitive',
    setup = function()
      require('mappings').fugitive()
    end,
  }

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('settings.gitsigns')
    end
  }

  -- Impatient
  use 'lewis6991/impatient.nvim'

  -- Indent Blankline
  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'dashboard-nvim',
    config = function()
      require('settings.indent-blankline')
    end,
  }

  -- Language Server
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('settings.lspconfig')
    end
  }

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown'},
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

  -- Snippets
  use {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter',
  }
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('settings.luasnip')
    end
  }

  -- Solidity
  use {
    'TovarishFin/vim-solidity',
    ft = {'solidity'},
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('settings.statusline')
    end,
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
    },
    setup = function()
      require('mappings').telescope()
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

  -- Trouble
  use {
    "folke/trouble.nvim",
    config = function()
      require('settings.trouble')
    end,
    setup = function()
      require('mappings').trouble()
    end,
  }
end)
