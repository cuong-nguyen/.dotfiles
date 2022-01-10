set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Auto source vimrc file located in working dir, e.g. `vim ...workding dir...`
set exrc 

set relativenumber

" Show real line number of current line
set nu 

set noerrorbells

" Highlight term as searching
set incsearch

" Scroll as cursor reach offset
set scrolloff=8

" Column on the left, for things like linting errors, git integration,...
set signcolumn=yes

" Column at max characters
set colorcolumn=80

" highlight current line
set cursorline

" vim-plug =======================================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'nvim-lua/plenary.nvim' " Telescope dependency
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'gruvbox-community/gruvbox' " Color scheme
Plug 'neovim/nvim-lspconfig' " Language Server Protocol support, e.g. Typescript,..
Plug 'williamboman/nvim-lsp-installer' " LSP servers installer
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:NERDTreeHijackNetrw = 0
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

colorscheme gruvbox
highlight Normal guibg=none

" Run Prettier before buffer is updated e.g. on Save
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.mjs,*.ts,*.tsx,*.json,*.css,*.scss,*.md,*.html Prettier
augroup END

" """"""""""""""""""""""""""""""""""" REMAP """"""""""""""""""""""""""""""""""""

" remap (mode mapFrom mapTo) ====================================
" n = normal mode
" nore = no recursive execution
" map = map

let mapleader = " "

" nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" trigger autocomplete box
inoremap <silent><expr> <C-space> coc#refresh()

" Telescope search
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" Use Tab key to select autocomplete item
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" lsp provider to find the cursor word definition and reference
" post install (yarn install | npm install) then load plugin only for editing supported files
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

