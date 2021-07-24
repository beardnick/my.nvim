
nnoremap <leader>ft :NvimTreeToggle<CR>
nnoremap <leader>f/ :NvimTreeFindFile<CR>


lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
    {key = {"l"}          ,cb = tree_cb("edit")},
    {key = {"."}           ,cb = tree_cb("toggle_dotfiles")},
    {key =  {"h"} ,cb          = tree_cb("close_node")},
    }
EOF


