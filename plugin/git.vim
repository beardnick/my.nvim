
lua <<EOF
require('gitsigns').setup{
 keymaps = {
    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
 },
}
EOF
