
local g = vim.g

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
}

for _, plugin in pairs(disabled_built_ins) do 
  g["loaded_" .. plugin] = 1
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')

Plug('nvim-tree/nvim-web-devicons')

Plug('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically

vim.cmd [[
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  " or                                , { 'branch': '0.1.x' }


  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

  Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

  "Plug 'andviro/flake8-vim'
]]


Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

--For vsnip users.
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug('dense-analysis/ale')
-- Plug('psf/black')
--Plug('lewis6991/gitsigns.nvim')  --Find out what it does before installing it
--Plug('junegunn/fzf')

-- Plug('nvim-treesitter/nvim-treesitter')

--Plug('numToStr/Comment.nvim')
-- Plug('dense-analysis/ale')

-- Plug('vim-pyright/pyright')

-- On-demand loading: loaded when the specified command is executed
-- Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })


-- vim.cmd [[
--     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
--     Plug 'junegunn/fzf.vim' 
--
--
-- ]]
--
vim.call('plug#end')

