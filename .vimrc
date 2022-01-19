set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

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

let g:NERDTreeHijackNetrw = 0
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" coc extensions
let g:coc_global_extensions = [
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ ]
" from README
" if hidden is not set, TextEdit might fail
set hidden

colorscheme gruvbox
highlight Normal guibg=none

" setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Run Prettier before buffer is updated e.g. on Save
augroup fmt
  autocmd!
  autocmd BufWritePre *.* Prettier
augroup END

" """"""""""""""""""""""""""""""""""" REMAP """"""""""""""""""""""""""""""""""""

let mapleader = " "

" nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" trigger autocomplete box
inoremap <silent><expr> <C-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use Tab key to select autocomplete item
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

