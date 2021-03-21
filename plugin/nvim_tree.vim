
nnoremap <leader>ft :NvimTreeToggle<CR>


lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["l"]           = tree_cb("edit"),
      ["."]              = tree_cb("toggle_dotfiles"),
      ["h"]           = tree_cb("close_node"),
    }
EOF


