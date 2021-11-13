if !myplug#Loaded('nvim-tree.lua')
    finish
endif

nnoremap <leader>ft :NvimTreeToggle<CR>
nnoremap <leader>f/ :NvimTreeFindFile<CR>


lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    list = {
    {key = {"l"}          ,cb = tree_cb("edit")},
    {key = {"."}           ,cb = tree_cb("toggle_dotfiles")},
    {key =  {"h"} ,cb          = tree_cb("close_node")},
    }

    require'nvim-tree'.setup {
        disable_netrw       = false,
        hijack_netrw        = false,
        update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
        },
        view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
        custom_only = false,
        list = list
        }
    },
    }
EOF