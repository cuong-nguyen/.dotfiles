if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>

lua << EOF
local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_prefix = ">> ",
    layout_config = {
      prompt_position = "top" 
    },
    sorting_strategy = "ascending",
    file_ignore_patterns = {"node_modules"}
  }
}
EOF
