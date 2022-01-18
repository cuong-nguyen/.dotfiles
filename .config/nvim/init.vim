set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

lua << EOF
  require('telescope').setup{
    defaults = {
      prompt_prefix = "@ ",
      layout_config = {
        prompt_position = "top"
      },
      sorting_strategy = "ascending"
    }
  }
  require("telescope").load_extension "fzf"
EOF

