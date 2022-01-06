set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
  require('telescope').setup{
    defaults = {
      -- file_ignore_patterns = {"node_modules"},
      file_sorter = require('telescope.sorters').get_fzy_sorter,
    }
  }
EOF

lua << EOF
  local lsp_installer = require "nvim-lsp-installer"

  -- Include the servers you want to have installed by default below
  local servers = {
    "tsserver",
  }

  for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
      if not server:is_installed() then
        print("Installing " .. name)
        server:install()
      end
    end
  end
EOF
