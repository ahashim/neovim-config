----- PLUGINS -----

return require('packer').startup(function()
  -- Packer 
  use 'wbthomason/packer.nvim'
  
  -- Plenary 
  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      {
	"nvim-telescope/telescope-fzf-native.nvim",
	run = "make",
      }, 
    }
  }
end)
