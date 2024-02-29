-- To install packer visit https://github.com/wbthomason/packer.nvim
--
-- Telescope also requries ripgrep exe to make the grep command work to 
-- to insstall it use:
-- brew isntall ripgrep
--
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'Mofiqul/vscode.nvim'
end)
