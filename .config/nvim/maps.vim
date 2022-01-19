let mapleader = " "

" move between window
nmap ;w <C-w>w

nnoremap <leader>t :NERDTreeToggle<CR>

" trigger autocomplete box
inoremap <silent><expr> <C-space> coc#refresh()

" Use Tab key to select autocomplete item
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "      <Tab>"




