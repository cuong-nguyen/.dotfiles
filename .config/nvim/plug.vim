if has("nvim")
  let g:plug_home = stdpath('data') .  '/plugged'
endif

call plug#begin()

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
endif

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Telescope dependency
Plug 'nvim-lua/plenary.nvim'

" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Theme color
Plug 'gruvbox-community/gruvbox'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status bar
" Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Better netrw
Plug 'preservim/nerdtree'

Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

call plug#end()

